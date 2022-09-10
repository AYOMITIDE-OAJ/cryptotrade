// To parse this JSON data, do
//

class TradingPair {
  int baseDecimals;
  String minimumOrder;
  String name;
  double counterDecimals;
  String trading;
  String urlSymbol;
  String description;

  TradingPair({
    this.baseDecimals = 0,
    this.minimumOrder = '',
    this.name = '',
    this.counterDecimals = 0.0,
    this.trading = '',
    this.urlSymbol = '',
    this.description = '',
  });

  factory TradingPair.fromMap(Map<String, dynamic> json) => TradingPair(
        baseDecimals: int.parse("${json["base_decimals"] ?? 0}") ?? 0,
        minimumOrder: json["minimum_order"] ?? '',
        name: json["name"] ?? '',
        counterDecimals: double.parse('${json['counter_decimals'] ?? 0.0}') ?? 0.0,
        trading: json["trading"] ?? '',
        urlSymbol: json["url_symbol"] ?? '',
        description: json["description"] ?? '',
      );
}
