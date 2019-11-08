import 'dart:async';

import 'package:demo_flutter_app/src/data/service/invoice/invoice_service.dart';
import 'package:demo_flutter_app/src/model/invoice.dart';
import 'package:demo_flutter_app/src/model/list_paged.dart';

class InvoiceRepository{

  final InvoiceService invoiceService;
  static InvoiceRepository _instant;

  InvoiceRepository._internal({this.invoiceService});

  factory InvoiceRepository(){
    if(_instant == null){
      _instant = InvoiceRepository._internal(invoiceService: InvoiceService());
    }
    return _instant;
  }

  Invoice fromJson( map){
    return Invoice.fromJson(map);
  }

  Future<ListPaged<Invoice>> getInvoices(int pageNumber, int pageSize) async{

    var c = Completer<ListPaged<Invoice>>();

    var response = await invoiceService.getInvoices(pageNumber, pageSize);
    var listPaged = ListPaged<Invoice>.fromJson(response.data, fromJson);

    c.complete(listPaged);
    return c.future;
  }

  Future<Invoice> getInvoice(String invoiceId) async{

    var c = Completer<Invoice>();

    var response = await invoiceService.getInvoice(invoiceId);
    var invoice = Invoice.fromJson(response.data);

    c.complete(invoice);
    return c.future;
  }

  Future<bool> createInvoice(Invoice invoice) async{

    var c = Completer<bool>();

    var response = await invoiceService.createInvoice(invoice);
    if(response.statusCode == 200){
      c.complete(true);
    }else{
      c.complete(false);
    }


    return c.future;
  }

}