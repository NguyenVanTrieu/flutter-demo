import 'dart:async';

import 'package:demo_flutter_app/src/data/service/product/product_service.dart';
import 'package:demo_flutter_app/src/model/list_paged.dart';
import 'package:demo_flutter_app/src/model/product.dart';

class ProductRepository{

  final ProductService productService;
  static ProductRepository _instant;

  ProductRepository._internal({this.productService});

  factory ProductRepository(){
    if(_instant == null){
      _instant = ProductRepository._internal(productService: ProductService());
    }
    return _instant;
  }

  Product fromJson( map){
    return Product.fromJson(map);
  }

  Future<ListPaged<Product>> getProducts(String search, int pageNumber, int pageSize) async{

    var c = Completer<ListPaged<Product>>();

    var response = await productService.getProducts(search, pageNumber, pageSize);
    var listPaged = ListPaged<Product>.fromJson(response.data, fromJson);

    c.complete(listPaged);
    return c.future;
  }

}