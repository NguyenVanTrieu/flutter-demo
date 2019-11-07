import 'package:decimal/decimal.dart';

class Invoice{
  String id;
  Decimal amount;
  String status;
  String regUser;
  DateTime regDttm;

  List<InvoiceDetail> details;

  Invoice(this.id, this.amount, this.status, this.regUser, this.regDttm, this.details);
  Invoice.newInvoice();
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

}