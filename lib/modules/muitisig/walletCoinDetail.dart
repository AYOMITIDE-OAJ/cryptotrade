import 'dart:convert';

import 'package:animator/animator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/global.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:cryptocurrencymarket/graphDetail/OHLCVGraph.dart';
import 'package:cryptocurrencymarket/graphDetail/QuickPercentChangeBar.dart';
import 'package:cryptocurrencymarket/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';

class WalletCoinDetail extends StatefulWidget {
  final String coinName;
  final String shortName;

  const WalletCoinDetail({Key key, this.coinName, this.shortName}) : super(key: key);
  @override
  _WalletCoinDetailState createState() => _WalletCoinDetailState();
}

class _WalletCoinDetailState extends State<WalletCoinDetail> {
  var appBarheight = 0.0;

  bool _isInProgress = false;

  String historyAmt = "720";
  String historyType = "minute";
  String historyTotal = "24h";
  String historyAgg = "2";
  String _high = "0";
  String _low = "0";
  String _change = "0";

  List historyOHLCV;

  Map generalStats;

  int currentOHLCVWidthSetting = 0;

  @override
  void initState() {
    super.initState();
    loadUserDetails();
  }

  loadUserDetails() async {
    setState(() {
      _isInProgress = true;
    });
    changeHistory(historyType, historyAmt, historyTotal, historyAgg);
    //await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      _isInProgress = false;
    });
  }

  Future<Null> changeHistory(String type, String amt, String total, String agg) async {
    setState(() {
      _high = "0";
      _low = "0";
      _change = "0";

      historyAmt = amt;
      historyType = type;
      historyTotal = total;
      historyAgg = agg;

      historyOHLCV = null;
    });
    _makeGeneralStats();
    await getHistoryOHLCV();
    _getHL();
  }

  _makeGeneralStats() {
    for (Map coin in marketListData) {
      if (coin["symbol"] == widget.shortName) {
        generalStats = coin["quotes"]["USD"];
        setState(() {});
        break;
      }
    }
  }

  _getHL() {
    num highReturn = -double.infinity;
    num lowReturn = double.infinity;

    for (var i in historyOHLCV) {
      if (i["high"] > highReturn) {
        highReturn = i["high"].toDouble();
      }
      if (i["low"] < lowReturn) {
        lowReturn = i["low"].toDouble();
      }
    }

    _high = normalizeNumNoCommas(highReturn);
    _low = normalizeNumNoCommas(lowReturn);

    var start = historyOHLCV[0]["open"] == 0 ? 1 : historyOHLCV[0]["open"];
    var end = historyOHLCV.last["close"];
    var changePercent = (end - start) / start * 100;
    _change = changePercent.toStringAsFixed(2);
  }

  Future<Null> getHistoryOHLCV() async {
    var response = await http.get(
        Uri.encodeFull("https://min-api.cryptocompare.com/data/histo" +
            ohlcvWidthOptions[historyTotal][currentOHLCVWidthSetting][3] +
            "?fsym=" +
            widget.shortName +
            "&tsym=USD&limit=" +
            (ohlcvWidthOptions[historyTotal][currentOHLCVWidthSetting][1] - 1).toString() +
            "&aggregate=" +
            ohlcvWidthOptions[historyTotal][currentOHLCVWidthSetting][2].toString()),
        headers: {"Accept": "application/json"});
    setState(() {
      historyOHLCV = new JsonDecoder().convert(response.body)["Data"];
      if (historyOHLCV == null) {
        historyOHLCV = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar();
    appBarheight = appBar.preferredSize.height;
    return Stack(
      children: <Widget>[
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor(globals.primaryColorString).withOpacity(0.6),
                HexColor(globals.primaryColorString).withOpacity(0.6),
                HexColor(globals.primaryColorString).withOpacity(0.6),
                HexColor(globals.primaryColorString).withOpacity(0.6),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: AllCoustomTheme.getThemeData().primaryColor,
          body: ModalProgressHUD(
            inAsyncCall: _isInProgress,
            opacity: 0,
            progressIndicator: CupertinoActivityIndicator(
              radius: 12,
            ),
            child: !_isInProgress
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: appBarheight,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Animator(
                                tween: Tween<Offset>(begin: Offset(0, 0), end: Offset(0.2, 0)),
                                duration: Duration(seconds: 1),
                                cycles: 0,
                                builder: (anim) => FractionalTranslation(
                                  translation: anim.value,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: AllCoustomTheme.getTextThemeColors(),
                                  ),
                                ),
                              ),
                            ),
                            historyOHLCV != null
                                ? Animator(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.decelerate,
                                    cycles: 1,
                                    builder: (anim) => Transform.scale(
                                      scale: anim.value,
                                      child: Text(
                                        widget.coinName + ',' + widget.shortName,
                                        style: TextStyle(
                                          color: AllCoustomTheme.getTextThemeColors(),
                                          fontSize: ConstanceData.SIZE_TITLE18,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            Icon(
                              Icons.more_horiz,
                              color: AllCoustomTheme.getsecoundTextThemeColor(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                        ),
                        child: historyOHLCV != null
                            ? Animator(
                                duration: Duration(seconds: 1),
                                curve: Curves.decelerate,
                                cycles: 1,
                                builder: (anim) => Transform.scale(
                                  scale: anim.value,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: CachedNetworkImage(
                                          errorWidget: (context, url, error) => CircleAvatar(
                                            backgroundColor: AllCoustomTheme.getsecoundTextThemeColor(),
                                            child: Text(
                                              widget.shortName.substring(0, 1),
                                            ),
                                          ),
                                          imageUrl: coinImageURL + widget.shortName.toLowerCase() + "@2x.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                '\$',
                                                style: TextStyle(
                                                  color: AllCoustomTheme.getTextThemeColors(),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                normalizeNumNoCommas(
                                                  generalStats["price"],
                                                ),
                                                style: TextStyle(
                                                  color: AllCoustomTheme.getTextThemeColors(),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: ConstanceData.SIZE_TITLE25,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: SizedBox(),
                                      ),
                                      Text(
                                        generalStats["percent_change_1h"].toString() + '%',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: generalStats["percent_change_1h"].toString().contains('-') ? Colors.red : Colors.green,
                                          fontSize: ConstanceData.SIZE_TITLE14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: historyOHLCV != null
                              ? historyOHLCV.isEmpty != true
                                  ? Animator(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.decelerate,
                                      cycles: 1,
                                      builder: (anim) => Transform.scale(
                                        scale: anim.value,
                                        child: OHLCVGraph(
                                          data: historyOHLCV,
                                          enableGridLines: true,
                                          gridLineColor: globals.buttoncolor1,
                                          gridLineLabelColor: AllCoustomTheme.getsecoundTextThemeColor(),
                                          gridLineAmount: 4,
                                          volumeProp: 0.3,
                                          lineWidth: 1,
                                          gridLineWidth: 0.5,
                                          decreaseColor: Colors.red,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      alignment: Alignment.topCenter,
                                      child: Text("No OHLCV data found :(", style: Theme.of(context).textTheme.caption),
                                    )
                              : Container(
                                  child: Center(
                                    child: CupertinoActivityIndicator(
                                      radius: 12,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      generalStats != null
                          ? historyOHLCV != null
                              ? Animator(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.decelerate,
                                  cycles: 1,
                                  builder: (anim) => Transform.scale(
                                    scale: anim.value,
                                    child: QuickPercentChangeBar(
                                      snapshot: generalStats,
                                    ),
                                  ),
                                )
                              : SizedBox()
                          : Container(
                              height: 0.0,
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      generalStats != null
                          ? historyOHLCV != null
                              ? Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Animator(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.decelerate,
                                      cycles: 1,
                                      builder: (anim) => Transform.scale(
                                        scale: anim.value,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                            color: AllCoustomTheme.boxColor(),
                                          ),
                                          child: SingleChildScrollView(
                                            physics: BouncingScrollPhysics(),
                                            child: Column(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          'Wallet',
                                                          style: TextStyle(
                                                            color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: ConstanceData.SIZE_TITLE18,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          '+19.8%',
                                                          style: TextStyle(
                                                            color: AllCoustomTheme.getTextThemeColors(),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: ConstanceData.SIZE_TITLE20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            LinearPercentIndicator(
                                                              padding: EdgeInsets.all(0),
                                                              width: 100.0,
                                                              lineHeight: 2,
                                                              percent: 0.8,
                                                              backgroundColor: AllCoustomTheme.getsecoundTextThemeColor(),
                                                              progressColor: Colors.blue,
                                                              animation: true,
                                                              animationDuration: 2500,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          'Market',
                                                          style: TextStyle(
                                                            color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: ConstanceData.SIZE_TITLE18,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          '+10.4%',
                                                          style: TextStyle(
                                                            color: AllCoustomTheme.getTextThemeColors(),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: ConstanceData.SIZE_TITLE20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            LinearPercentIndicator(
                                                              padding: EdgeInsets.all(0),
                                                              width: 100.0,
                                                              lineHeight: 2,
                                                              percent: 0.4,
                                                              backgroundColor: AllCoustomTheme.getsecoundTextThemeColor(),
                                                              progressColor: Colors.green,
                                                              animation: true,
                                                              animationDuration: 2500,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          'Market Value',
                                                          style: TextStyle(
                                                            color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: ConstanceData.SIZE_TITLE18,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          '+89.1%',
                                                          style: TextStyle(
                                                            color: AllCoustomTheme.getTextThemeColors(),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: ConstanceData.SIZE_TITLE20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            LinearPercentIndicator(
                                                              padding: EdgeInsets.all(0),
                                                              width: 100.0,
                                                              lineHeight: 2,
                                                              percent: 0.9,
                                                              backgroundColor: AllCoustomTheme.getsecoundTextThemeColor(),
                                                              progressColor: Colors.red,
                                                              animation: true,
                                                              animationDuration: 2500,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          'Coin Value',
                                                          style: TextStyle(
                                                            color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: ConstanceData.SIZE_TITLE18,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          '+90.7%',
                                                          style: TextStyle(
                                                            color: AllCoustomTheme.getTextThemeColors(),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: ConstanceData.SIZE_TITLE20,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            LinearPercentIndicator(
                                                              padding: EdgeInsets.all(0),
                                                              width: 100.0,
                                                              lineHeight: 2,
                                                              percent: 0.6,
                                                              backgroundColor: AllCoustomTheme.getsecoundTextThemeColor(),
                                                              progressColor: Colors.orange,
                                                              animation: true,
                                                              animationDuration: 2500,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox()
                          : SizedBox()
                    ],
                  )
                : SizedBox(),
          ),
        )
      ],
    );
  }
}
