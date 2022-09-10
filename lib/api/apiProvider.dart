import 'dart:convert';
import 'package:cryptocurrencymarket/model/PairDetailInfoModel.dart';
import 'package:cryptocurrencymarket/model/PairTransactionDetailModel.dart';
import 'package:cryptocurrencymarket/model/liveCryptoNewsModel.dart';
import 'package:http/http.dart' as http;
import 'package:cryptocurrencymarket/constance/constance.dart';
import 'package:cryptocurrencymarket/model/liveTradingPairModel.dart';

class ApiProvider {
  Future<List<TradingPair>> getTradingPairsDetail() async {
    String urlString = ConstanceData.LiveTradingPairs;
    List<TradingPair> responseData = List<TradingPair>();
    try {
      var response = await http.get(Uri.encodeFull(urlString), headers: {
        "Accept": "application/json",
      });
      if (response.statusCode == 200) {
        var responseBody = new JsonDecoder().convert(response.body);
        for (var key in responseBody) {
          responseData.add(TradingPair.fromMap(key));
        }
      }
    } catch (e) {
      print(e);
    }
    return responseData;
  }

  Future<PairDetailInfo> getPairInfoDetail(String pairName) async {
    String urlString = ConstanceData.PairsDetail;
    PairDetailInfo responseData;
    try {
      var response = await http.get(Uri.encodeFull(urlString + pairName), headers: {
        "Accept": "application/json",
      });
      if (response.statusCode == 200) {
        responseData = PairDetailInfo.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
    return responseData;
  }

  Future<List<TransactionDetail>> getPairsTransactionDetail(String pairName) async {
    String urlString = ConstanceData.PairsTransaction;
    List<TransactionDetail> responseData = List<TransactionDetail>();
    try {
      var response = await http.get(Uri.encodeFull(urlString + pairName), headers: {
        "Accept": "application/json",
      });
      if (response.statusCode == 200) {
        var responseBody = new JsonDecoder().convert(response.body);
        for (var key in responseBody) {
          responseData.add(TransactionDetail.fromMap(key));
        }
      }
    } catch (e) {
      print(e);
    }
    return responseData;
  }

  Future<CryptoNewsLive> cryptoNews(String pairName) async {
    String urlString = 'https://newsapi.org/v2/everything?q=$pairName&apiKey=dc47f2d8143a4a24b6935f7ea7413c63';
    CryptoNewsLive responseData;
    try {
      var response = await http.get(Uri.encodeFull(urlString), headers: {
        "Accept": "application/json",
      });
      if (response.statusCode == 200) {
        responseData = CryptoNewsLive.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
    return responseData;
  }
}
