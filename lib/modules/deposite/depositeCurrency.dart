import 'package:animator/animator.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/global.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:cryptocurrencymarket/modules/drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DepositeCurrency extends StatefulWidget {
  @override
  _DepositeCurrencyState createState() => _DepositeCurrencyState();
}

class _DepositeCurrencyState extends State<DepositeCurrency> {
  bool _isInProgress = false;

  var appBarheight = 0.0;

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
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
            width: MediaQuery.of(context).size.width * 0.75 < 400 ? MediaQuery.of(context).size.width * 0.75 : 350,
            child: Drawer(
              elevation: 0,
              child: AppDrawer(
                selectItemName: 'deposite',
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
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                    color: AllCoustomTheme.getsecoundTextThemeColor(),
                                  ),
                                ),
                                Animator(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.decelerate,
                                  cycles: 1,
                                  builder: (anim) => Transform.scale(
                                    scale: anim.value,
                                    child: Text(
                                      "Request Payment",
                                      style: TextStyle(
                                        color: AllCoustomTheme.getTextThemeColors(),
                                        fontSize: ConstanceData.SIZE_TITLE18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Animator(
                            duration: Duration(seconds: 1),
                            curve: Curves.decelerate,
                            cycles: 1,
                            builder: (anim) => Transform.scale(
                              scale: anim.value,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        ConstanceData.barCodeImage,
                                        height: 150,
                                        width: 150,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'zhxczxcsaudg23874t237rgufbw892yrfhne',
                                        style: TextStyle(
                                          color: AllCoustomTheme.getTextThemeColors(),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16, left: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              color: AllCoustomTheme.boxColor(),
                                            ),
                                            child: TextFormField(
                                              onSaved: (value) {
                                                btc = value;
                                              },
                                              keyboardType: TextInputType.number,
                                              style: TextStyle(
                                                fontSize: ConstanceData.SIZE_TITLE16,
                                                color: AllCoustomTheme.getTextThemeColors(),
                                              ),
                                              cursorColor: AllCoustomTheme.getTextThemeColors(),
                                              decoration: InputDecoration(
                                                hintText: 'BTC',
                                                prefixIcon: Icon(
                                                  FontAwesomeIcons.bitcoin,
                                                  size: 18,
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
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              color: AllCoustomTheme.boxColor(),
                                            ),
                                            child: TextFormField(
                                              onSaved: (value) {
                                                usd = value;
                                              },
                                              keyboardType: TextInputType.number,
                                              style: TextStyle(
                                                fontSize: ConstanceData.SIZE_TITLE16,
                                                color: AllCoustomTheme.getTextThemeColors(),
                                              ),
                                              cursorColor: AllCoustomTheme.getTextThemeColors(),
                                              decoration: InputDecoration(
                                                hintText: 'USD',
                                                prefixIcon: Icon(
                                                  FontAwesomeIcons.dollarSign,
                                                  size: 16,
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
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16, left: 16),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'To',
                                          style: TextStyle(
                                            color: AllCoustomTheme.getsecoundTextThemeColor(),
                                            fontWeight: FontWeight.bold,
                                            fontSize: ConstanceData.SIZE_TITLE18,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Column(
                                      children: <Widget>[
                                        MagicBoxGradiantLine(),
                                        Container(
                                          height: 85,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                                            color: AllCoustomTheme.boxColor(),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 14, left: 14, bottom: 6),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      FontAwesomeIcons.bitcoin,
                                                      size: 40,
                                                      color: AllCoustomTheme.getTextThemeColors(),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          'Bitcoin',
                                                          style: TextStyle(
                                                            color: AllCoustomTheme.getTextThemeColors(),
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          'BTC',
                                                          style: TextStyle(
                                                            color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: ConstanceData.SIZE_TITLE14,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(),
                                                    ),
                                                    AnimatedForwardArrow(
                                                      isShowingarroeForward: true,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16, right: 16),
                                    child: !isShowingPopup
                                        ? Animator(
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
                                                    "Request Payment",
                                                    style: TextStyle(
                                                        color: AllCoustomTheme.getReBlackAndWhiteThemeColors(),
                                                        letterSpacing: 0.3,
                                                        fontSize: ConstanceData.SIZE_TITLE16),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  openShowPopup();
                                                },
                                              ),
                                            ),
                                          )
                                        : CupertinoActivityIndicator(
                                            radius: 12,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(
                  child: CupertinoActivityIndicator(
                    radius: 12,
                  ),
                ),
        )
      ],
    );
  }

  String btc = '';
  String usd = '';

  bool isShowingPopup = false;

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
              'You did succsessfully Request \$$btc BTC.\n and $usd',
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
