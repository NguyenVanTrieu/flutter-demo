import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/data/repository/invoice_repository.dart';
import 'package:demo_flutter_app/src/model/invoice.dart';

class InvoiceBillingDetailBloc extends BaseBloc {
  String invoiceId;

  InvoiceRepository _invoiceRepository;

  InvoiceBillingDetailBloc({this.invoiceId}) {
    invoiceId = invoiceId;
    _invoiceRepository = InvoiceRepository();
  }

  @override
  void dispatchEvent(BaseEvent event) {

  }

  Future<Invoice> getInvoice(String invoiceId) async{
    Invoice result = await _invoiceRepository.getInvoice(invoiceId);
    return result;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
