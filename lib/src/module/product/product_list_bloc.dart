import 'dart:async';
import 'package:decimal/decimal.dart';
import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/model/product.dart';

class ProductListBloc extends BaseBloc {

  List<Product> products = [
    for(int i = 0; i < 22; i++) Product("i_$i", "name_$i", Decimal.fromInt(i))
  ];

  StreamController<List<Product>> _streamControllerListProduct = StreamController<List<Product>>();
  Stream<List<Product>> get listProductStream => _streamControllerListProduct.stream;
  Sink<List<Product>> get _listProductSink => _streamControllerListProduct.sink;

  @override
  void dispatchEvent(BaseEvent event) {

  }

  Stream<List<Product>> getProductList() {
    _listProductSink.add(products);
    return listProductStream;
  }

  @override
  void dispose() {
    _streamControllerListProduct.close();

    super.dispose();
  }
}