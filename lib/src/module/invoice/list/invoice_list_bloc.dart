import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/data/repository/invoice_repository.dart';
import 'package:demo_flutter_app/src/model/invoice.dart';
import 'package:demo_flutter_app/src/model/list_paged.dart';

class InvoiceListBloc extends BaseBloc {

  InvoiceRepository _invoiceRepository;

  InvoiceListBloc(){
    _invoiceRepository = InvoiceRepository();
  }

  Future<List<Invoice>> pageData(int previousCount) async {

    ListPaged<Invoice> invoices = await _invoiceRepository.getInvoices((previousCount / 14).floor(), 14);
    return invoices.items;
  }

  @override
  void dispatchEvent(BaseEvent event) {

  }

  @override
  void dispose() {
    super.dispose();
  }
}