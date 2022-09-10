import 'package:animator/animator.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:cryptocurrencymarket/modules/drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WithDrawCurrency extends StatefulWidget {
  @override
  _WithDrawCurrencyState createState() => _WithDrawCurrencyState();
}

class _WithDrawCurrencyState extends State<WithDrawCurrency> {
  bool _isInProgress = false;
  bool isShowingPopup = false;

  var appBarheight = 0.0;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  String btc = '';
  String quantity = '';
  String fee = '';

  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    waitTime();
  }

  waitTime() async {
    setState(() {
      _isInProgress = true;
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
          key: _scaffoldKey,
          drawer: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75 < 400
                ? MediaQuery.of(context).size.width * 0.75
                : 350,
            child: Drawer(
              elevation: 0,
              child: AppDrawer(
                selectItemName: 'withdraw',
              ),
            ),
          ),
          backgroundColor: AllCoustomTheme.getThemeData().primaryColor,
          body: !_isInProgress
              ? InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Form(
                    key: _formKey,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState.openDrawer();
                                },
                                child: Icon(
                                  Icons.sort,
                                  color: AllCoustomTheme
                                      .getsecoundTextThemeColor(),
                                ),
                              ),
                              Animator(
                                duration: Duration(seconds: 1),
                                curve: Curves.decelerate,
                                cycles: 1,
                                builder: (anim) => Transform.scale(
                                  scale: anim.value,
                                  child: Text(
                                    "Withdraw Payment",
                                    style: TextStyle(
                                      color:
                                          AllCoustomTheme.getTextThemeColors(),
                                      fontSize: ConstanceData.SIZE_TITLE18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.gift,
                                size: 16,
                                color:
                                    AllCoustomTheme.getsecoundTextThemeColor(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Animator(
                              tween: Tween<double>(begin: 0, end: 1),
                              duration: Duration(seconds: 1),
                              cycles: 1,
                              builder: (anim) => SizeTransition(
                                sizeFactor: anim,
                                axis: Axis.horizontal,
                                axisAlignment: 1,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: Text(
                                            '\$',
                                            style: TextStyle(
                                              color: AllCoustomTheme
                                                  .getTextThemeColors(),
                                              fontSize:
                                                  ConstanceData.SIZE_TITLE18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '1,689',
                                          style: TextStyle(
                                            color: AllCoustomTheme
                                                .getTextThemeColors(),
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '.25',
                                          style: TextStyle(
                                            color: AllCoustomTheme
                                                .getTextThemeColors(),
                                            fontSize:
                                                ConstanceData.SIZE_TITLE18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Animator(
                              tween: Tween<double>(begin: 0, end: 1),
                              duration: Duration(seconds: 1),
                              cycles: 1,
                              builder: (anim) => SizeTransition(
                                  sizeFactor: anim,
                                  axis: Axis.horizontal,
                                  axisAlignment: 1,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            color: AllCoustomTheme
                                                .getsecoundTextThemeColor(),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12, left: 12),
                                            child: Center(
                                              child: Text(
                                                'Schedule',
                                                style: TextStyle(
                                                  color: AllCoustomTheme
                                                      .getTextThemeColors(),
                                                  fontSize: ConstanceData
                                                      .SIZE_TITLE14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Animator(
                          duration: Duration(seconds: 1),
                          curve: Curves.decelerate,
                          cycles: 1,
                          builder: (anim) => Transform.scale(
                            scale: anim.value,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 16,
                                left: 16,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: AllCoustomTheme.boxColor(),
                                    ),
                                    child: TextFormField(
                                      onSaved: (value) {
                                        btc = value;
                                      },
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                        fontSize: ConstanceData.SIZE_TITLE16,
                                        color: AllCoustomTheme
                                            .getTextThemeColors(),
                                      ),
                                      cursorColor:
                                          AllCoustomTheme.getTextThemeColors(),
                                      decoration: InputDecoration(
                                        hintText: 'BTC Withdrawal Address',
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.bitcoin,
                                          size: 14,
                                          color: AllCoustomTheme
                                              .getsecoundTextThemeColor(),
                                        ),
                                        hintStyle: TextStyle(
                                          fontSize: ConstanceData.SIZE_TITLE16,
                                          color: AllCoustomTheme
                                              .getsecoundTextThemeColor(),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: AllCoustomTheme.boxColor(),
                                    ),
                                    child: TextFormField(
                                      onSaved: (value) {
                                        quantity = value;
                                      },
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                        fontSize: ConstanceData.SIZE_TITLE16,
                                        color: AllCoustomTheme
                                            .getTextThemeColors(),
                                      ),
                                      cursorColor:
                                          AllCoustomTheme.getTextThemeColors(),
                                      decoration: InputDecoration(
                                        hintText: 'Quantity',
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.sortNumericUp,
                                          size: 14,
                                          color: AllCoustomTheme
                                              .getsecoundTextThemeColor(),
                                        ),
                                        hintStyle: TextStyle(
                                          fontSize: ConstanceData.SIZE_TITLE16,
                                          color: AllCoustomTheme
                                              .getsecoundTextThemeColor(),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: AllCoustomTheme.boxColor(),
                                    ),
                                    child: TextFormField(
                                      onSaved: (value) {
                                        fee = value;
                                      },
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                        fontSize: ConstanceData.SIZE_TITLE16,
                                        color: AllCoustomTheme
                                            .getTextThemeColors(),
                                      ),
                                      cursorColor:
                                          AllCoustomTheme.getTextThemeColors(),
                                      decoration: InputDecoration(
                                        hintText: 'Fee',
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.dollarSign,
                                          size: 14,
                                          color: AllCoustomTheme
                                              .getsecoundTextThemeColor(),
                                        ),
                                        hintStyle: TextStyle(
                                          fontSize: ConstanceData.SIZE_TITLE16,
                                          color: AllCoustomTheme
                                              .getsecoundTextThemeColor(),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        !isShowingPopup
                            ? Animator(
                                duration: Duration(seconds: 1),
                                curve: Curves.decelerate,
                                cycles: 1,
                                builder: (anim) => Transform.scale(
                                  scale: anim.value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    child: Animator(
                                      tween: Tween<double>(begin: 0.9, end: 1),
                                      curve: Curves.elasticIn,
                                      cycles: 0,
                                      builder: (anim) => Transform.scale(
                                        scale: anim.value,
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0),
                                          child: Container(
                                            height: 47,
                                            alignment: FractionalOffset.center,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  globals.buttoncolor1,
                                                  globals.buttoncolor2,
                                                ],
                                              ),
                                            ),
                                            child: Text(
                                              "Withdraw Payment",
                                              style: TextStyle(
                                                  color: AllCoustomTheme
                                                      .getReBlackAndWhiteThemeColors(),
                                                  letterSpacing: 0.3,
                                                  fontSize: ConstanceData
                                                      .SIZE_TITLE16),
                                            ),
                                          ),
                                          onPressed: () {
                                            openShowPopup();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 48,
                                child: CupertinoActivityIndicator(
                                  radius: 12,
                                ),
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        Animator(
                          duration: Duration(seconds: 1),
                          curve: Curves.decelerate,
                          cycles: 1,
                          builder: (anim) => Transform.scale(
                            scale: anim.value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Balance',
                                    style: TextStyle(
                                      color: AllCoustomTheme
                                          .getsecoundTextThemeColor(),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '- Settlement',
                                    style: TextStyle(
                                      color:
                                          AllCoustomTheme.getTextThemeColors(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                ),
                                color: AllCoustomTheme.boxColor(),
                              ),
                              child: Animator(
                                duration: Duration(seconds: 1),
                                curve: Curves.decelerate,
                                cycles: 1,
                                builder: (anim) => Transform.scale(
                                  scale: anim.value,
                                  child: ListView(
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.only(top: 20),
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '+ 114.5 ANT',
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getTextThemeColors(),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      '08.14.2019',
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getsecoundTextThemeColor(),
                                                        fontSize: ConstanceData
                                                            .SIZE_TITLE14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16),
                                                  child: Text(
                                                    '\$1990.56',
                                                    style: TextStyle(
                                                      color: AllCoustomTheme
                                                          .getTextThemeColors(),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Divider(
                                              color: AllCoustomTheme
                                                  .getsecoundTextThemeColor(),
                                              thickness: 1,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '+ 114.5 ANT',
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getTextThemeColors(),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      '08.14.2019',
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getsecoundTextThemeColor(),
                                                        fontSize: ConstanceData
                                                            .SIZE_TITLE14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16),
                                                  child: Text(
                                                    '\$1990.56',
                                                    style: TextStyle(
                                                      color: AllCoustomTheme
                                                          .getTextThemeColors(),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Divider(
                                              color: AllCoustomTheme
                                                  .getsecoundTextThemeColor(),
                                              thickness: 1,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '+ 204.4 ANT',
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getTextThemeColors(),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      '02.27.2018',
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getsecoundTextThemeColor(),
                                                        fontSize: ConstanceData
                                                            .SIZE_TITLE14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16),
                                                  child: Text(
                                                    '\$25.24',
                                                    style: TextStyle(
                                                      color: AllCoustomTheme
                                                          .getTextThemeColors(),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Divider(
                                              color: AllCoustomTheme
                                                  .getsecoundTextThemeColor(),
                                              thickness: 1,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '+ 362.5 ANT',
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getTextThemeColors(),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      '11.26.2017',
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getsecoundTextThemeColor(),
                                                        fontSize: ConstanceData
                                                            .SIZE_TITLE14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16),
                                                  child: Text(
                                                    '\$2000.37',
                                                    style: TextStyle(
                                                      color: AllCoustomTheme
                                                          .getTextThemeColors(),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Divider(
                                              color: AllCoustomTheme
                                                  .getsecoundTextThemeColor(),
                                              thickness: 1,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '+ 101.7 ANT',
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getTextThemeColors(),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Text(
                                                      '03.01.2018',
                                                      style: TextStyle(
                                                        color: AllCoustomTheme
                                                            .getsecoundTextThemeColor(),
                                                        fontSize: ConstanceData
                                                            .SIZE_TITLE14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 16),
                                                  child: Text(
                                                    '\$5004.69',
                                                    style: TextStyle(
                                                      color: AllCoustomTheme
                                                          .getTextThemeColors(),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CupertinoActivityIndicator(
                    radius: 12,
                  ),
                ),
        ),
      ],
    );
  }

  openShowPopup() async {
    setState(() {
      isShowingPopup = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isShowingPopup = false;
    });
    _formKey.currentState.save();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AllCoustomTheme.boxColor(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Animator(
              duration: Duration(seconds: 1),
              cycles: 1,
              builder: (anim) => Transform.scale(
                scale: anim.value,
                child: Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Congrats',
              style: TextStyle(
                color: AllCoustomTheme.getTextThemeColors(),
                fontWeight: FontWeight.bold,
                fontSize: ConstanceData.SIZE_TITLE25,
                fontFamily: 'Ubuntu',
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'You did succsessfully Withdraw $btc BTC.\with Quntity $quantity and fee \$$fee',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Ubuntu',
                color: AllCoustomTheme.getTextThemeColors(),
                fontSize: ConstanceData.SIZE_TITLE16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Animator(
              duration: Duration(seconds: 1),
              cycles: 1,
              builder: (anim) => Transform.scale(
                scale: anim.value,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 45.0,
                    alignment: FractionalOffset.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          globals.buttoncolor1,
                          globals.buttoncolor2,
                        ],
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: AllCoustomTheme.getReBlackAndWhiteThemeColors(),
                        fontSize: ConstanceData.SIZE_TITLE16,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
