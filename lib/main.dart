import 'dart:convert';
import 'dart:io';
import 'package:cryptocurrencymarket/splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screen/screen.dart';
import 'auth/authenticationScreen.dart';
import 'constance/global.dart';
import 'constance/routes.dart';
import 'constance/themes.dart';
import 'modules/home/homeScreen.dart';
import 'modules/introduction/introductionScreen.dart';
import 'modules/introduction/swipeIndtroduction.dart';

Map portfolioMap;
List marketListData = [];

void main() async {
  Map portfolioMap;
  Screen.keepOn(true);
  await getApplicationDocumentsDirectory().then((Directory directory) async {
    File jsonFile = new File(directory.path + "/portfolio.json");
    if (jsonFile.existsSync()) {
      portfolioMap = json.decode(jsonFile.readAsStringSync());
    } else {
      jsonFile.createSync();
      jsonFile.writeAsStringSync("{}");
      portfolioMap = {};
    }
    if (portfolioMap == null) {
      portfolioMap = {};
    }
    jsonFile = new File(directory.path + "/marketData.json");
    if (jsonFile.existsSync()) {
      marketListData = json.decode(jsonFile.readAsStringSync());
    } else {
      jsonFile.createSync();
      jsonFile.writeAsStringSync("[]");
      marketListData = [];
    }
  });

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then(
    (_) => runApp(
      MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool allCoin = false;

  @override
  void initState() {
    super.initState();
    getApiAllData(0);
  }

  Future<Null> getApiAllData(int index) async {
    List allCoinList = [];
    var coindata = await getData(index);
    if (coindata != null) {
      if (coindata.length != 0) {
        index += coindata.length;
        if (index == 0) {
          setState(() {
            allCoinList.addAll(coindata.values);
          });
        } else {
          allCoinList.addAll(coindata.values);
          setState(() {
            allCoinList.removeWhere(
                (length) => length['quotes']['USD']['market_cap'] == null);
            if (allCoin == true) {
              getApiAllData(index);
            }
            marketListData.addAll(allCoinList);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: AllCoustomTheme.getThemeData().primaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return Container(
      color: AllCoustomTheme.getThemeData().primaryColor,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto Trade',
        routes: routes,
        theme: AllCoustomTheme.getThemeData(),
      ),
    );
  }

  var routes = <String, WidgetBuilder>{
    Routes.SPLASH: (BuildContext context) => SplashScreen(),
    Routes.Introdution: (BuildContext context) => IntroductionScreen(),
    Routes.SwipeIntrodution: (BuildContext context) =>
        SwipeIntroductionScreen(),
    Routes.Auth: (BuildContext context) => AuthenticationScreen(),
    Routes.Home: (BuildContext context) => HomeScreen(),
  };
}
