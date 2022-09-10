import 'dart:math';
import 'package:animator/animator.dart';
import 'package:connectivity/connectivity.dart';
import 'package:cryptocurrencymarket/api/apiProvider.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/global.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:cryptocurrencymarket/model/liveTradingPairModel.dart';
import 'package:cryptocurrencymarket/modules/drawer/drawer.dart';
import 'package:cryptocurrencymarket/modules/tradingPair/pairDescription.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LiveTradingPair extends StatefulWidget {
  @override
  _LiveTradingPairState createState() => _LiveTradingPairState();
}

class _LiveTradingPairState extends State<LiveTradingPair> {
  bool _isInProgress = false;

  var appBarheight = 0.0;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<TradingPair> tradingPair;
  List<TradingPair> searchTradingPair = [];

  var subscription;

  @override
  void initState() {
    super.initState();
    checkConnection();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result.index != 2) {
        showInSnackBar(ConstanceData.GotInternet, isGreeen: true);
        loadUserDetails();
      } else {
        showInSnackBar(ConstanceData.NoInternet, isGreeen: false);
      }
    });
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  Future showInSnackBar(String value, {bool isGreeen = false}) async {
    await Future.delayed(const Duration(milliseconds: 700));
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(
          value,
          style: TextStyle(
            color: AllCoustomTheme.getReBlackAndWhiteThemeColors(),
          ),
        ),
        backgroundColor: isGreeen ? Colors.green : Colors.red,
      ),
    );
  }

  checkConnection() async {
    loadUserDetails();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showInSnackBar(ConstanceData.NoInternet, isGreeen: false);
    }
  }

  loadUserDetails() async {
    setState(() {
      _isInProgress = true;
    });
    tradingPair = await ApiProvider().getTradingPairsDetail();
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
          key: _scaffoldKey,
          drawer: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75 < 400
                ? MediaQuery.of(context).size.width * 0.75
                : 350,
            child: Drawer(
              child: AppDrawer(
                selectItemName: 'tradingpair',
              ),
            ),
          ),
          backgroundColor: AllCoustomTheme.getThemeData().primaryColor,
          body: ModalProgressHUD(
            inAsyncCall: _isInProgress,
            opacity: 0,
            progressIndicator: CupertinoActivityIndicator(
              radius: 12,
            ),
            child: Column(
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
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Icon(
                          Icons.sort,
                          color: AllCoustomTheme.getsecoundTextThemeColor(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Animator(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: Duration(seconds: 1),
                      cycles: 1,
                      builder: (anim) => SizeTransition(
                        sizeFactor: anim,
                        axis: Axis.horizontal,
                        axisAlignment: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            'Live trading pair',
                            style: TextStyle(
                              color: AllCoustomTheme.getTextThemeColors(),
                              fontWeight: FontWeight.bold,
                              fontSize: ConstanceData.SIZE_TITLE25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                  ),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: AllCoustomTheme.boxColor(),
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: ConstanceData.SIZE_TITLE16,
                        color: AllCoustomTheme.getTextThemeColors(),
                      ),
                      cursorColor: AllCoustomTheme.getTextThemeColors(),
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          color: AllCoustomTheme.getsecoundTextThemeColor(),
                        ),
                        hintStyle: TextStyle(
                          fontSize: ConstanceData.SIZE_TITLE16,
                          color: AllCoustomTheme.getsecoundTextThemeColor(),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Pair Name',
                        style: TextStyle(
                          color: AllCoustomTheme.getsecoundTextThemeColor(),
                        ),
                      ),
                      Text(
                        'Min. Order price',
                        style: TextStyle(
                          color: AllCoustomTheme.getsecoundTextThemeColor(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                !_isInProgress
                    ? tradingPair.length != 0
                        ? Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.only(top: 4),
                              physics: BouncingScrollPhysics(),
                              itemCount: _isSearch
                                  ? searchTradingPair.length
                                  : tradingPair.length,
                              itemBuilder: (context, index) {
                                var finalTradingPair = _isSearch
                                    ? searchTradingPair[index]
                                    : tradingPair[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: Animator(
                                    duration: Duration(seconds: 1),
                                    cycles: 1,
                                    builder: (anim) => Transform.scale(
                                      scale: anim.value,
                                      child: Column(
                                        children: <Widget>[
                                          MagicBoxGradiantLine(),
                                          Container(
                                            height: 85,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20)),
                                              color:
                                                  AllCoustomTheme.boxColor(),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10),
                                              child: Column(
                                                children: <Widget>[
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        finalTradingPair.name
                                                                .toString() +
                                                            ' (' +
                                                            finalTradingPair
                                                                .urlSymbol +
                                                            ')',
                                                        style: TextStyle(
                                                          color: AllCoustomTheme
                                                              .getTextThemeColors(),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: SizedBox(),
                                                      ),
                                                      Text(
                                                        finalTradingPair
                                                            .minimumOrder
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: AllCoustomTheme
                                                              .getTextThemeColors(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        finalTradingPair
                                                            .description
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: AllCoustomTheme
                                                              .getTextThemeColors(),
                                                          fontSize:
                                                              ConstanceData
                                                                  .SIZE_TITLE12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 2,
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .check_circle_outline,
                                                          size: 14,
                                                          color: Colors.green,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        finalTradingPair
                                                            .trading,
                                                        style: TextStyle(
                                                          color: AllCoustomTheme
                                                              .getTextThemeColors(),
                                                          fontSize:
                                                              ConstanceData
                                                                  .SIZE_TITLE12,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: SizedBox(),
                                                      ),
                                                      InkWell(
                                                        highlightColor: Colors
                                                            .transparent,
                                                        splashColor: Colors
                                                            .transparent,
                                                        onTap: () {
                                                          Navigator.of(
                                                                  context)
                                                              .push(
                                                            CupertinoPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  PairDescription(
                                                                tradingPair:
                                                                    finalTradingPair,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child:
                                                            AnimatedForwardArrow(
                                                          isShowingarroeForward:
                                                              true,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 14,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Animator(
                                  tween: Tween<double>(begin: 0, end: 2 * pi),
                                  duration: Duration(seconds: 2),
                                  repeats: 0,
                                  builder: (anim) => Transform(
                                    transform: Matrix4.rotationZ(anim.value),
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Image.asset(
                                        ConstanceData.planetImage,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Animator(
                                  duration: Duration(seconds: 1),
                                  cycles: 1,
                                  builder: (anim) => Transform.scale(
                                    scale: anim.value,
                                    child: Text(
                                      'Something Wents To Wrong\nPlease try Again',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AllCoustomTheme
                                            .getTextThemeColors(),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                    : SizedBox(),
              ],
            ),
          ),
        )
      ],
    );
  }

  void filterSearchResults(String query) {
    searchTradingPair.clear();
    if (query != "") {
      tradingPair.forEach((pair) {
        if (pair.name.contains(query) ||
            pair.name.toLowerCase().contains(query) ||
            pair.name.toUpperCase().contains(query) ||
            pair.description.contains(query) ||
            pair.description.toLowerCase().contains(query) ||
            pair.description.toUpperCase().contains(query)) {
          searchTradingPair.add(pair);
        }
      });
      setState(() {
        _isSearch = true;
      });
    } else {
      setState(() {
        _isSearch = false;
      });
    }
  }

  bool _isSearch = false;
}
