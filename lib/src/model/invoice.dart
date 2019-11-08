import 'package:decimal/decimal.dart';
import 'package:demo_flutter_app/src/model/product.dart';
import 'package:demo_flutter_app/src/utils/iist_id_helper.dart';

class Invoice {
  String id;
  Decimal amount;
  String status;
  String regUser;
  DateTime regDttm;

  List<InvoiceDetail> invoiceDetails;

  Invoice(this.id, this.amount, this.status, this.regUser, this.regDttm,
      this.invoiceDetails);
  Invoice.newInvoice();

  Invoice addProduct(Product product) {
    this.amount = this.amount + product.price;

    if (this.invoiceDetails == null || this.invoiceDetails.isEmpty) {
      this.invoiceDetails = [];
      InvoiceDetail detail = InvoiceDetail.fromProduct(id, product);
      this.invoiceDetails.add(detail);
      return this;
    }

    bool flagAdd = true;
    for (int i = 0; i < this.invoiceDetails.length; i++) {
      InvoiceDetail detail = this.invoiceDetails[i];
      if (detail.productId.compareTo(product.id) == 0) {
        detail.quantity = detail.quantity + Decimal.one;
        flagAdd = false;
        return this;
      }
    }

    if (flagAdd) {
      InvoiceDetail detail = InvoiceDetail.fromProduct(this.id, product);
      this.invoiceDetails.add(detail);
      return this;
    }
    return this;
  }

  Invoice.fromJson( map){
    id = map['id'];
    status = map['status'];
    amount = Decimal.parse(map['amount'].toString());
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount.toDouble(),
        "status": status,
        "invoiceDetails": (invoiceDetails != null && invoiceDetails.isNotEmpty)
            ? invoiceDetails.map((detail) => detail.toJson()).toList()
            : null,
      };
}

class InvoiceDetail {
  String id;
  String invoiceId;
  String productId;
  String productName;
  Decimal quantity;
  Decimal price;
  String status;
  String regUser;
  DateTime regDttm;

  InvoiceDetail(
      {this.id,
      this.invoiceId,
      this.productId,
      this.productName,
      this.quantity,
      this.price,
      this.status,
      this.regUser,
      this.regDttm});

  Map<String, dynamic> toJson() => {
        "id": id,
        "invoiceId": invoiceId,
        "productId": productId,
        "productName": productName,
        "quantity": quantity.toDouble(),
        "price": price.toDouble(),
        "status": status,
      };

  factory InvoiceDetail.fromProduct(String invoiceId, Product product) {
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
