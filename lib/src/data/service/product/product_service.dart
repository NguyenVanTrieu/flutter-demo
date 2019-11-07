
import 'package:demo_flutter_app/src/network/iist_client.dart';
import 'package:dio/dio.dart';

class ProductService{

  static ProductService _instant;
  ProductService._internal();

  factory ProductService(){
    if(_instant == null){
      _instant = ProductService._internal();
    }
    return _instant;
  }

  Future<Response> getProducts(String search, int pageNumber, int pageSize) {
    return IISTClient().dio.get(
      "/api/v1/products",
      queryParameters: {
        "search": search,
        "pageSize": pageSize,
        "pageNumber": pageNumber
      },
    );
  }
}