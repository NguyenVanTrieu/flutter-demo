import 'dart:async';
import 'package:decimal/decimal.dart';
import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/data/repository/product_repository.dart';
import 'package:demo_flutter_app/src/model/list_paged.dart';
import 'package:demo_flutter_app/src/model/product.dart';

class ProductListBloc extends BaseBloc {

/*  StreamController<List<Product>> _streamControllerListProduct = StreamController<List<Product>>();
  Stream<List<Product>> get listProductStream => _streamControllerListProduct.stream;
  Sink<List<Product>> get _listProductSink => _streamControllerListProduct.sink;*/

  ProductRepository _productRepository = ProductRepository();

  @override
  void dispatchEvent(BaseEvent event) {

  }

  Future<List<Product>> pageData(int previousCount) async {

    List<Product> products;
    await _productRepository.getProducts(null, (previousCount / 12).floor(), 12).then((value){
      products = value.items;
    });
    return products;
  }

  @override
  void dispose() {
//    _streamControllerListProduct.close();

    super.dispose();
  }
}