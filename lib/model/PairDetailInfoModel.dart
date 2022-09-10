class PairDetailInfo {
  String high;
  String last;
  String timestamp;
  String bid;
  String vwap;
  String volume;
  String low;
  String ask;
  String open;

  PairDetailInfo({this.high, this.last, this.timestamp, this.bid, this.vwap, this.volume, this.low, this.ask, this.open});

  PairDetailInfo.fromJson(Map<String, dynamic> json) {
    high = json['high'];
    last = json['last'];
    timestamp = json['timestamp'];
    bid = json['bid'];
    vwap = json['vwap'];
    volume = json['volume'];
    low = json['low'];
    ask = json['ask'];
    open = json['open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['high'] = this.high;
    data['last'] = this.last;
    data['timestamp'] = this.timestamp;
    data['bid'] = this.bid;
    data['vwap'] = this.vwap;
    data['volume'] = this.volume;
    data['low'] = this.low;
    data['ask'] = this.ask;
    data['open'] = this.open;
    return data;
  }
}
