import 'package:animator/animator.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;
import 'package:cryptocurrencymarket/model/PairTransactionDetailModel.dart';
import 'package:cryptocurrencymarket/model/liveTradingPairModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:shimmer/shimmer.dart';

class TradingPairChart extends StatefulWidget {
  final List<TransactionDetail> transactionDetail;
  final TradingPair tradingPair;

  const TradingPairChart({Key key, this.transactionDetail, this.tradingPair}) : super(key: key);
  @override
  _TradingPairChartState createState() => _TradingPairChartState();
}

class _TradingPairChartState extends State<TradingPairChart> {
  var appBarheight = 0.0;
  List<double> transactionList = [];

  bool _isInProgress = false;

  @override
  void initState() {
    super.initState();
    setChart();
  }

  setChart() async {
    setState(() {
      _isInProgress = true;
    });
    widget.transactionDetail.sort((f, g) => g.date.compareTo(f.date));
    widget.transactionDetail.forEach((f) {
      transactionList.add(f.price);
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isInProgress = false;
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
          body: Column(
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
                    !_isInProgress
                        ? Animator(
                            duration: Duration(seconds: 1),
                            curve: Curves.decelerate,
                            cycles: 1,
                            builder: (anim) => Transform.scale(
                              scale: anim.value,
                              child: Text(
                                widget.tradingPair.name,
                                style: TextStyle(color: AllCoustomTheme.getTextThemeColors(), fontSize: ConstanceData.SIZE_TITLE18),
                              ),
                            ),
                          )
                        : SizedBox(),
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setChart();
                          },
                          child: Icon(
                            Icons.notifications,
                            color: AllCoustomTheme.getsecoundTextThemeColor(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 1,
                          ),
                          child: Animator(
                            tween: Tween<double>(begin: 0.8, end: 1),
                            curve: Curves.fastOutSlowIn,
                            cycles: 0,
                            builder: (anim) => Transform.scale(
                              scale: anim.value,
                              child: CircleAvatar(
                                radius: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [globals.buttoncolor1, globals.buttoncolor2],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              !_isInProgress
                  ? Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Animator(
                        duration: Duration(seconds: 1),
                        cycles: 1,
                        builder: (anim) => SizeTransition(
                          sizeFactor: anim,
                          axisAlignment: -1,
                          axis: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Price',
                                style: TextStyle(
                                  color: AllCoustomTheme.getTextThemeColors(),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 200,
                                child: Sparkline(
                                  data: transactionList,
                                  lineGradient: LinearGradient(
                                    colors: [globals.buttoncolor1, globals.buttoncolor2],
                                  ),
                                  pointColor: AllCoustomTheme.getTextThemeColors(),
                                  lineWidth: 1,
                                  fillMode: FillMode.below,
                                  fillGradient: LinearGradient(colors: [globals.buttoncolor1, globals.buttoncolor2]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 200,
                      child: Center(
                        child: CupertinoActivityIndicator(
                          radius: 12,
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Time',
                      style: TextStyle(
                        color: AllCoustomTheme.getTextThemeColors(),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                      color: AllCoustomTheme.boxColor(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Column(
                        children: <Widget>[
                          !_isInProgress
                              ? Expanded(
                                  child: ListView(
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.all(0),
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Bitcoin/US Dollars',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getsecoundTextThemeColor(),
                                            ),
                                          ),
                                          Text(
                                            '12.01.2019',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getTextThemeColors(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: AllCoustomTheme.getsecoundTextThemeColor(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Euro/CDN Dollars',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getsecoundTextThemeColor(),
                                            ),
                                          ),
                                          Text(
                                            '17.12.2019',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getTextThemeColors(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: AllCoustomTheme.getsecoundTextThemeColor(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Ethereum/CDN Dollars',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getsecoundTextThemeColor(),
                                            ),
                                          ),
                                          Text(
                                            '15.05.2019',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getTextThemeColors(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: AllCoustomTheme.getsecoundTextThemeColor(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Bitcoin/CDN Dollars',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getsecoundTextThemeColor(),
                                            ),
                                          ),
                                          Text(
                                            '24.05.2020',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getTextThemeColors(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: AllCoustomTheme.getsecoundTextThemeColor(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Bitcoin/US Dollars',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getsecoundTextThemeColor(),
                                            ),
                                          ),
                                          Text(
                                            '12.01.2019',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getTextThemeColors(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: AllCoustomTheme.getsecoundTextThemeColor(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Euro/CDN Dollars',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getsecoundTextThemeColor(),
                                            ),
                                          ),
                                          Text(
                                            '23.01.2018',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getTextThemeColors(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: AllCoustomTheme.getsecoundTextThemeColor(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Ethereum/CDN Dollars',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getsecoundTextThemeColor(),
                                            ),
                                          ),
                                          Text(
                                            '13.12.2019',
                                            style: TextStyle(
                                              color: AllCoustomTheme.getTextThemeColors(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                )
                              : Expanded(
                                  child: SingleChildScrollView(
                                    physics: NeverScrollableScrollPhysics(),
                                    child: Shimmer.fromColors(
                                      baseColor: globals.buttoncolor1,
                                      highlightColor: globals.buttoncolor2,
                                      enabled: true,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Column(
                                          children: [
                                            1,
                                            1,
                                            2,
                                            1,
                                            1,
                                            1,
                                            1,
                                            1,
                                            1,
                                          ]
                                              .map(
                                                (_) => Column(
                                                  children: <Widget>[
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                width: double.infinity,
                                                                height: 8.0,
                                                                color: Colors.white,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                              ),
                                                              Container(
                                                                width: 40.0,
                                                                height: 8.0,
                                                                color: Colors.white,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
