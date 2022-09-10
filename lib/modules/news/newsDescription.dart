import 'package:animator/animator.dart';
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrencymarket/constance/global.dart' as globals;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsDescription extends StatefulWidget {
  final String title;
  final String url;

  const NewsDescription({Key key, this.title, this.url}) : super(key: key);
  @override
  _NewsDescriptionState createState() => _NewsDescriptionState();
}

class _NewsDescriptionState extends State<NewsDescription> {
  var appBarheight = 0.0;

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
                    Animator(
                      duration: Duration(seconds: 1),
                      curve: Curves.decelerate,
                      cycles: 1,
                      builder: (anim) => Transform.scale(
                        scale: anim.value,
                        child: Text(
                          'Crypto News',
                          style: TextStyle(
                            color: AllCoustomTheme.getTextThemeColors(),
                            fontSize: ConstanceData.SIZE_TITLE18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Animator(
                  duration: Duration(seconds: 1),
                  cycles: 1,
                  builder: (anim) => Transform.scale(
                    scale: anim.value,
                    child: WebviewScaffold(
                      url: widget.url,
                      withZoom: true,
                      withLocalStorage: true,
                      appCacheEnabled: true,
                      resizeToAvoidBottomInset: true,
                      initialChild: Container(
                        color: Colors.transparent,
                        child: Center(
                          child: CupertinoActivityIndicator(
                            radius: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
