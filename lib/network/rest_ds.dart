import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:plantly/network/network_util.dart';
import 'package:plantly/redux/models/products.dart';
class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final PRODUCTS_URL='http://www.codenextgen.com/products/products.json';

  @override
  Future<Products> getProducts(int pageNumber, int pageSize) async {
    final url = "${PRODUCTS_URL}";
    final httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();

      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        var data = JSON.decode(json);

       // log(data);

        return Products.fromMap(data);
      } else {
        //log("Failed http call.");
      }
    } catch (exception) {
      print(exception.toString());
    }
    return null;
  }
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}