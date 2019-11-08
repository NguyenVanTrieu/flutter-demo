import 'package:decimal/decimal.dart';
import 'package:demo_flutter_app/src/model/product.dart';
import 'package:demo_flutter_app/src/utils/iist_id_helper.dart';

class Invoice{
  String id;
  Decimal amount;
  String status;
  String regUser;
  DateTime regDttm;

  List<InvoiceDetail> details;

  Invoice(this.id, this.amount, this.status, this.regUser, this.regDttm, this.details);
  Invoice.newInvoice();

  Invoice addProduct(Product product){
    this.amount = this.amount + product.price;

    if(this.details == null || this.details.isEmpty){
      this.details = [];
      InvoiceDetail detail = InvoiceDetail.fromProduct(id, product);
      this.details.add(detail);
      return this;
    }

    bool flagAdd = true;
    for(int i = 0; i < this.details.length; i ++){
      InvoiceDetail detail = this.details[i];
      if (detail.productId.compareTo(product.id) == 0) {
        detail.quantity = detail.quantity + Decimal.one;
        flagAdd = false;
        return this;
      }
    }

    if(flagAdd) {
      InvoiceDetail detail = InvoiceDetail.fromProduct(this.id, product);
      this.details.add(detail);
      return this;
    }
    return this;
  }
}

class InvoiceDetail{
  String id;
  String invoiceId;
  String productId;
  String productName;
  Decimal quantity;
  Decimal price;
  String status;
  String regUser;
  DateTime regDttm;

  InvoiceDetail({this.id, this.invoiceId, this.productId, this.productName, this.quantity, this.price, this.status, this.regUser, this.regDttm});

  factory InvoiceDetail.fromProduct(String invoiceId, Product product){
    return InvoiceDetail(
      id: IdHelper.genId(),
      invoiceId: invoiceId,
      productId: product.id,
      productName: product.name,
      quantity: Decimal.one,
      price: product.price,
      status: "ACTIVE",
    );
  }
}