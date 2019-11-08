import 'package:demo_flutter_app/src/model/invoice.dart';
import 'package:demo_flutter_app/src/network/iist_client.dart';
import 'package:dio/dio.dart';

class InvoiceService{

  static InvoiceService _instant;
  InvoiceService._internal();

  factory InvoiceService(){
    if(_instant == null){
      _instant = InvoiceService._internal();
    }
    return _instant;
  }

  Future<Response> createInvoice(Invoice invoice) {
    return IISTClient().dio.post(
      "/api/v1/invoices",
      data: invoice.toJson()
    );
  }

  Future<Response> getInvoices(int pageNumber, int pageSize) {
    return IISTClient().dio.get(
      "/api/v1/invoices",
      queryParameters: {
        "pageSize": pageSize,
        "pageNumber": pageNumber
      },
    );
  }
}