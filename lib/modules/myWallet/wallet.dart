import 'dart:math';

import 'package:animator/animator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/global.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:cryptocurrencymarket/modules/drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  var appBarheight = 0.0;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isInProgress = false;

  @override
  void initState() {
    super.initState();
    loadUserDetails();
  }

  loadUserDetails() async {
    setState(() {
      _isInProgress = true;
    });
    await Future.delayed(const Duration(milliseconds: 700));
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
              child: AppDrawer(
                selectItemName: 'wallet',
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
                              tween: Tween<double>(begin: 0, end: 1),
                              duration: Duration(seconds: 1),
                              cycles: 1,
                              builder: (anim) => SizeTransition(
                                sizeFactor: anim,
                                axis: Axis.horizontal,
                                axisAlignment: 1,
                                child: Image.asset(
                                  ConstanceData.appIcon,
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                                  'Wallet',
                                  style: TextStyle(
                                    color: AllCoustomTheme.getsecoundTextThemeColor(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '\$',
                              style: TextStyle(
                                color: AllCoustomTheme.getTextThemeColors(),
                                fontWeight: FontWeight.bold,
                                fontSize: ConstanceData.SIZE_TITLE20,
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
                                child: Text(
                                  '2,564',
                                  style: TextStyle(
                                    color: AllCoustomTheme.getTextThemeColors(),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                            ),
                            Animator(
                              duration: Duration(seconds: 1),
                              cycles: 1,
                              builder: (anim) => Transform.scale(
                                scale: anim.value,
                                child: Text(
                                  '.95',
                                  style: TextStyle(
                                    color: AllCoustomTheme.getTextThemeColors(),
                                    fontWeight: FontWeight.bold,
                                    fontSize: ConstanceData.SIZE_TITLE20,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Animator(
                              tween: Tween<double>(begin: 0, end: 2 * pi),
                              duration: Duration(seconds: 2),
                              repeats: 0,
                              builder: (anim) => Transform(
                                transform: Matrix4.rotationZ(anim.value),
                                alignment: Alignment.center,
                                child: Center(
                                  child: Image.asset(
                                    ConstanceData.planetImage,
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: AnimatedDivider(),
                      ),
                      SizedBox(
                        height: 16,
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
                                  'My Investments',
                                  style: TextStyle(
                                    color: AllCoustomTheme.getsecoundTextThemeColor(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16, right: 2),
                        height: 130,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Animator(
                              duration: Duration(seconds: 1),
                              cycles: 1,
                              builder: (anim) => Transform.scale(
                                scale: anim.value,
                                child: Container(
                                  color: AllCoustomTheme.boxColor(),
                                  width: 230,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 2,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(2)),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              globals.buttoncolor1,
                                              globals.buttoncolor2,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12, left: 12),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'BTCCoin',
                                              style: TextStyle(
                                                color: AllCoustomTheme.getTextThemeColors(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                                        child: Column(
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
                                                  '1534',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getTextThemeColors(),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: ConstanceData.SIZE_TITLE25,
                                                  ),
                                                ),
                                                Text(
                                                  '.56',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getTextThemeColors(),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: ConstanceData.SIZE_TITLE20,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                ),
                                                CachedNetworkImage(
                                                  imageUrl: 'https://static.coincap.io/assets/icons/btc@2x.png',
                                                  height: 45,
                                                  width: 45,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '0.023452',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Animator(
                              duration: Duration(seconds: 1),
                              cycles: 1,
                              builder: (anim) => Transform.scale(
                                scale: anim.value,
                                child: Container(
                                  color: AllCoustomTheme.boxColor(),
                                  width: 230,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 2,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(2)),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              globals.buttoncolor1,
                                              globals.buttoncolor2,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12, left: 12),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'LITECoin',
                                              style: TextStyle(
                                                color: AllCoustomTheme.getTextThemeColors(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                                        child: Column(
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
                                                  '192',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getTextThemeColors(),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: ConstanceData.SIZE_TITLE25,
                                                  ),
                                                ),
                                                Text(
                                                  '.42',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getTextThemeColors(),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: ConstanceData.SIZE_TITLE20,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                ),
                                                CachedNetworkImage(
                                                  imageUrl: 'https://static.coincap.io/assets/icons/ltc@2x.png',
                                                  height: 45,
                                                  width: 45,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '0.127489',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Animator(
                              duration: Duration(seconds: 1),
                              cycles: 1,
                              builder: (anim) => Transform.scale(
                                scale: anim.value,
                                child: Container(
                                  color: AllCoustomTheme.boxColor(),
                                  width: 230,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 2,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(2)),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              globals.buttoncolor1,
                                              globals.buttoncolor2,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12, left: 12),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'NEOCoin',
                                              style: TextStyle(
                                                color: AllCoustomTheme.getTextThemeColors(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                                        child: Column(
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
                                                  '2494',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getTextThemeColors(),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: ConstanceData.SIZE_TITLE25,
                                                  ),
                                                ),
                                                Text(
                                                  '.96',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getTextThemeColors(),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: ConstanceData.SIZE_TITLE20,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                ),
                                                CachedNetworkImage(
                                                  imageUrl: 'https://static.coincap.io/assets/icons/neo@2x.png',
                                                  height: 45,
                                                  width: 45,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '2.457952',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Animator(
                              duration: Duration(seconds: 1),
                              cycles: 1,
                              builder: (anim) => Transform.scale(
                                scale: anim.value,
                                child: Container(
                                  color: AllCoustomTheme.boxColor(),
                                  width: 230,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 2,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(2)),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              globals.buttoncolor1,
                                              globals.buttoncolor2,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12, left: 12),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              'DOGCoin',
                                              style: TextStyle(
                                                color: AllCoustomTheme.getTextThemeColors(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                                        child: Column(
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
                                                  '4562',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getTextThemeColors(),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: ConstanceData.SIZE_TITLE25,
                                                  ),
                                                ),
                                                Text(
                                                  '.34',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getTextThemeColors(),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: ConstanceData.SIZE_TITLE20,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                ),
                                                CachedNetworkImage(
                                                  imageUrl: 'https://static.coincap.io/assets/icons/doge@2x.png',
                                                  height: 45,
                                                  width: 45,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '2.457952',
                                                  style: TextStyle(
                                                    color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                                  'Recent transactions',
                                  style: TextStyle(
                                    color: AllCoustomTheme.getsecoundTextThemeColor(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(0),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                                      color: AllCoustomTheme.boxColor(),
                                    ),
                                    height: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16, top: 10),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Animator(
                                                tween: Tween<double>(begin: 0, end: 2 * pi),
                                                duration: Duration(seconds: 1),
                                                repeats: 1,
                                                builder: (anim) => Transform(
                                                  transform: Matrix4.rotationZ(anim.value),
                                                  alignment: Alignment.center,
                                                  child: CircleAvatar(
                                                    backgroundColor: AllCoustomTheme.getsecoundTextThemeColor(),
                                                    radius: 20,
                                                    child: Icon(
                                                      Icons.music_note,
                                                      color: AllCoustomTheme.boxColor(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Animator(
                                                    tween: Tween<double>(begin: 0, end: 1),
                                                    duration: Duration(seconds: 1),
                                                    cycles: 1,
                                                    builder: (anim) => SizeTransition(
                                                      sizeFactor: anim,
                                                      axis: Axis.horizontal,
                                                      axisAlignment: 1,
                                                      child: Text(
                                                        'Apple Music',
                                                        style: TextStyle(
                                                          color: AllCoustomTheme.getTextThemeColors(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Animator(
                                                    tween: Tween<double>(begin: 0, end: 1),
                                                    duration: Duration(seconds: 1),
                                                    cycles: 1,
                                                    builder: (anim) => SizeTransition(
                                                      sizeFactor: anim,
                                                      axis: Axis.horizontal,
                                                      axisAlignment: 1,
                                                      child: Text(
                                                        'SUBSCRIPTION',
                                                        style: TextStyle(
                                                          color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                          fontSize: ConstanceData.SIZE_TITLE12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 16),
                                                child: Animator(
                                                  duration: Duration(seconds: 1),
                                                  cycles: 1,
                                                  builder: (anim) => Transform.scale(
                                                    scale: anim.value,
                                                    child: Text(
                                                      "-\$10",
                                                      style: TextStyle(
                                                        color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50),
                                            child: AnimatedDivider(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: AllCoustomTheme.boxColor(),
                                    height: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Animator(
                                                tween: Tween<double>(begin: 0, end: 2 * pi),
                                                duration: Duration(seconds: 1),
                                                repeats: 1,
                                                builder: (anim) => Transform(
                                                  transform: Matrix4.rotationZ(anim.value),
                                                  alignment: Alignment.center,
                                                  child: CircleAvatar(
                                                    backgroundColor: AllCoustomTheme.getsecoundTextThemeColor(),
                                                    radius: 20,
                                                    child: Icon(
                                                      Icons.book,
                                                      color: AllCoustomTheme.boxColor(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Animator(
                                                    tween: Tween<double>(begin: 0, end: 1),
                                                    duration: Duration(seconds: 1),
                                                    cycles: 1,
                                                    builder: (anim) => SizeTransition(
                                                      sizeFactor: anim,
                                                      axis: Axis.horizontal,
                                                      axisAlignment: 1,
                                                      child: Text(
                                                        'Books',
                                                        style: TextStyle(
                                                          color: AllCoustomTheme.getTextThemeColors(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Animator(
                                                    tween: Tween<double>(begin: 0, end: 1),
                                                    duration: Duration(seconds: 1),
                                                    cycles: 1,
                                                    builder: (anim) => SizeTransition(
                                                      sizeFactor: anim,
                                                      axis: Axis.horizontal,
                                                      axisAlignment: 1,
                                                      child: Text(
                                                        'TEAM ACCOUNTS',
                                                        style: TextStyle(
                                                          color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                          fontSize: ConstanceData.SIZE_TITLE12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 16),
                                                child: Animator(
                                                  duration: Duration(seconds: 1),
                                                  cycles: 1,
                                                  builder: (anim) => Transform.scale(
                                                    scale: anim.value,
                                                    child: Text(
                                                      "-\$85",
                                                      style: TextStyle(
                                                        color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50),
                                            child: AnimatedDivider(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: AllCoustomTheme.boxColor(),
                                    height: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Animator(
                                                tween: Tween<double>(begin: 0, end: 2 * pi),
                                                duration: Duration(seconds: 1),
                                                repeats: 1,
                                                builder: (anim) => Transform(
                                                  transform: Matrix4.rotationZ(anim.value),
                                                  alignment: Alignment.center,
                                                  child: CircleAvatar(
                                                    backgroundColor: AllCoustomTheme.getsecoundTextThemeColor(),
                                                    radius: 20,
                                                    child: Icon(
                                                      Icons.location_on,
                                                      color: AllCoustomTheme.boxColor(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Animator(
                                                    tween: Tween<double>(begin: 0, end: 1),
                                                    duration: Duration(seconds: 1),
                                                    cycles: 1,
                                                    builder: (anim) => SizeTransition(
                                                      sizeFactor: anim,
                                                      axis: Axis.horizontal,
                                                      axisAlignment: 1,
                                                      child: Text(
                                                        'Flight',
                                                        style: TextStyle(
                                                          color: AllCoustomTheme.getTextThemeColors(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Animator(
                                                    tween: Tween<double>(begin: 0, end: 1),
                                                    duration: Duration(seconds: 1),
                                                    cycles: 1,
                                                    builder: (anim) => SizeTransition(
                                                      sizeFactor: anim,
                                                      axis: Axis.horizontal,
                                                      axisAlignment: 1,
                                                      child: Text(
                                                        '\$7 AIR LINE',
                                                        style: TextStyle(
                                                          color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                          fontSize: ConstanceData.SIZE_TITLE12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 16),
                                                child: Animator(
                                                  duration: Duration(seconds: 1),
                                                  cycles: 1,
                                                  builder: (anim) => Transform.scale(
                                                    scale: anim.value,
                                                    child: Text(
                                                      "-\$85",
                                                      style: TextStyle(
                                                        color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50),
                                            child: AnimatedDivider(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: AllCoustomTheme.boxColor(),
                                    height: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Animator(
                                                tween: Tween<double>(begin: 0, end: 2 * pi),
                                                duration: Duration(seconds: 1),
                                                repeats: 1,
                                                builder: (anim) => Transform(
                                                  transform: Matrix4.rotationZ(anim.value),
                                                  alignment: Alignment.center,
                                                  child: CircleAvatar(
                                                    backgroundColor: AllCoustomTheme.getsecoundTextThemeColor(),
                                                    radius: 20,
                                                    child: Icon(
                                                      FontAwesomeIcons.car,
                                                      color: AllCoustomTheme.boxColor(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Animator(
                                                    tween: Tween<double>(begin: 0, end: 1),
                                                    duration: Duration(seconds: 1),
                                                    cycles: 1,
                                                    builder: (anim) => SizeTransition(
                                                      sizeFactor: anim,
                                                      axis: Axis.horizontal,
                                                      axisAlignment: 1,
                                                      child: Text(
                                                        'Taxi Booking',
                                                        style: TextStyle(
                                                          color: AllCoustomTheme.getTextThemeColors(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Animator(
                                                    tween: Tween<double>(begin: 0, end: 1),
                                                    duration: Duration(seconds: 1),
                                                    cycles: 1,
                                                    builder: (anim) => SizeTransition(
                                                      sizeFactor: anim,
                                                      axis: Axis.horizontal,
                                                      axisAlignment: 1,
                                                      child: Text(
                                                        'UBER',
                                                        style: TextStyle(
                                                          color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                          fontSize: ConstanceData.SIZE_TITLE12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 16),
                                                child: Animator(
                                                  duration: Duration(seconds: 1),
                                                  cycles: 1,
                                                  builder: (anim) => Transform.scale(
                                                    scale: anim.value,
                                                    child: Text(
                                                      "-\$125",
                                                      style: TextStyle(
                                                        color: AllCoustomTheme.getsecoundTextThemeColor(),
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 50),
                                            child: AnimatedDivider(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : SizedBox(),
          ),
        )
      ],
    );
  }
}
