class TransactionDetail {
  String date;
  String tid;
  double price;
  String type;
  String amount;

  TransactionDetail({
    this.date,
    this.tid,
    this.price,
    this.type,
    this.amount,
  });

  factory TransactionDetail.fromMap(Map<String, dynamic> json) => TransactionDetail(
        date: json["date"] == null ? null : json["date"],
        tid: json["tid"] == null ? null : json["tid"],
        price: double.parse('${json['price'] ?? 0.0}') ?? 0.0,
        type: json["type"] == null ? null : json["type"],
        amount: json["amount"] == null ? null : json["amount"],
      );

  Map<String, dynamic> toMap() => {
        "date": date == null ? null : date,
        "tid": tid == null ? null : tid,
        "price": price == null ? null : price,
        "type": type == null ? null : type,
        "amount": amount == null ? null : amount,
      };
}
