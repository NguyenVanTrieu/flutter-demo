import 'dart:async';

import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/data/repository/product_repository.dart';
import 'package:demo_flutter_app/src/model/invoice.dart';
import 'package:demo_flutter_app/src/model/product.dart';
import 'package:demo_flutter_app/src/module/invoice/create/event/pick_product_event.dart';
import 'package:demo_flutter_app/src/utils/iist_id_helper.dart';
import 'package:decimal/decimal.dart';

class InvoiceCreateBloc extends BaseBloc {
  ProductRepository _productRepository;
  Invoice invoice;

  final StreamController<int> totalQuantity = StreamController<int>();
  Stream<int> get totalQuantityStream => totalQuantity.stream;
  Sink<int> get totalQuantitySink => totalQuantity.sink;
  int _totalQuantity = 0;

  InvoiceCreateBloc() {
    invoice = Invoice.newInvoice();
    invoice.id = IdHelper.genId();
    invoice.amount = Decimal.zero;
    invoice.status = "ACTIVE";
    _productRepository = ProductRepository();
  }

  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case PickProductEvent:
        handlePickProductEvent(event);
        break;
    }
  }

  void handlePickProductEvent(BaseEvent event) {
    PickProductEvent productEvent = event as PickProductEvent;
    invoice.addProduct(productEvent.product);

    _totalQuantity ++;
    totalQuantitySink.add(_totalQuantity);
  }

  Future<List<Product>> pageProducts(int previousCount) async {
    List<Product> products;
    await _productRepository
        .getProducts(null, (previousCount / 14).floor(), 14)
        .then((value) {
      products = value.items;
    });
    return products;
  }

  @override
  void dispose() {
    totalQuantity.close();
    super.dispose();
  }
}
