import 'package:cryptocurrencymarket/constance/themes.dart';
import 'package:flutter/material.dart';

class QuickPercentChangeBar extends StatelessWidget {
  QuickPercentChangeBar({this.snapshot});
  final Map snapshot;
  @override
  Widget build(BuildContext context) {
    snapshot.forEach((K, V) {
      if (V == null) {
        snapshot[K] = 0;
      }
    });
    return new Container(
      padding:
          const EdgeInsets.only( bottom: 10, top: 10.0),
          color: AllCoustomTheme.getThemeData().primaryColor,
      // decoration: new BoxDecoration(
      //     border: new Border(
      //       top: new BorderSide(color: Theme.of(context).bottomAppBarColor),
      //     ),
      //     color: Theme.of(context).primaryColor),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                "1h",
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .apply(color: Colors.white),
              ),
              new Padding(
                padding: const EdgeInsets.only(right: 3.0),
              ),
              new Text(
                snapshot["percent_change_1h"] >= 0
                    ? "+" + snapshot["percent_change_1h"].toString() + "%"
                    : snapshot["percent_change_1h"].toString() + "%",
                style: Theme.of(context).primaryTextTheme.body2.apply(
                      color: snapshot["percent_change_1h"] >= 0
                          ? Colors.green
                          : Colors.red,
                    ),
              )
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                "24h",
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .apply(color: Colors.white),
              ),
              new Padding(padding: const EdgeInsets.only(right: 3.0)),
              new Text(
                  snapshot["percent_change_24h"] >= 0
                      ? "+" + snapshot["percent_change_24h"].toString() + "%"
                      : snapshot["percent_change_24h"].toString() + "%",
                  style: Theme.of(context).primaryTextTheme.body2.apply(
                      color: snapshot["percent_change_24h"] >= 0
                          ? Colors.green
                          : Colors.red))
            ],
          ),
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                "7D",
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .apply(color: Colors.white),
              ),
              new Padding(padding: const EdgeInsets.only(right: 3.0)),
              new Text(
                snapshot["percent_change_7d"] >= 0
                    ? "+" + snapshot["percent_change_7d"].toString() + "%"
                    : snapshot["percent_change_7d"].toString() + "%",
                style: Theme.of(context).primaryTextTheme.body2.apply(
                      color: snapshot["percent_change_7d"] >= 0
                          ? Colors.green
                          : Colors.red,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
