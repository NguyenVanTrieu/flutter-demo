import 'dart:async';
import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/data/repository/product_repository.dart';
import 'package:demo_flutter_app/src/model/list_paged.dart';
import 'package:demo_flutter_app/src/model/product.dart';

class ProductListBloc extends BaseBloc {

  ProductRepository _productRepository = ProductRepository();
  @override
  void dispatchEvent(BaseEvent event) {

  }

  Future<List<Product>> pageData(int previousCount) async {
    ListPaged<Product> products = await _productRepository.getProducts(null, (previousCount / 14).floor(), 14);

    return products.items;
  }

  @override
  void dispose() {
    super.dispose();
  }
}