import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/data/repository/product_repository.dart';
import 'package:demo_flutter_app/src/model/invoice.dart';
import 'package:demo_flutter_app/src/model/product.dart';
import 'package:demo_flutter_app/src/module/invoice/create/event/pick_product.dart';
import 'package:demo_flutter_app/src/utils/iist_id_helper.dart';
import 'package:decimal/decimal.dart';

class InvoiceCreateBloc extends BaseBloc {
  ProductRepository _productRepository;
  Invoice invoice;

  InvoiceCreateBloc() {
    invoice = Invoice.newInvoice();
    invoice.id = IdHelper.genId();

    _productRepository = ProductRepository();
  }

  @override
  void dispatchEvent(BaseEvent event) {
    print("123");
    switch (event.runtimeType) {
      case PickProductEvent:
        handlePickProductEvent(event);
        break;
    }
  }

  void handlePickProductEvent(BaseEvent event) {
    PickProductEvent productEvent = event as PickProductEvent;
    invoice.amount = invoice.amount + productEvent.product.price;

    invoice.details.forEach((detail) {
      if (detail.productId.compareTo(productEvent.product.id) == 0) {
        detail.quantity = detail.quantity + Decimal.one;
      } else {
        InvoiceDetail detail = InvoiceDetail(
            id: IdHelper.genId(),
            invoiceId: invoice.id,
            productId: productEvent.product.id,
            productName: productEvent.product.name,
            quantity: Decimal.one,
            price: productEvent.product.price,
            status: "ACTIVE",
        );
        invoice.details.add(detail);
      }
    });

    invoice.details.forEach((detail) {
      print(detail.productName);
    });
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
    super.dispose();
  }
}
