import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/data/repository/invoice_repository.dart';
import 'package:demo_flutter_app/src/model/invoice.dart';
import 'package:demo_flutter_app/src/module/invoice/create/event/bill_payment_event.dart';

class InvoiceBillingBloc extends BaseBloc {
  Invoice invoice;

  InvoiceRepository _invoiceRepository;

  InvoiceBillingBloc({this.invoice}) {
    invoice = invoice;
    _invoiceRepository = InvoiceRepository();
  }

  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case BillPaymentEvent:
        handleBillPaymentEvent(event);
        break;
    }
  }

  void handleBillPaymentEvent(BaseEvent event) async{
    BillPaymentEvent billPaymentEvent = event as BillPaymentEvent;
    bool result = await _invoiceRepository.createInvoice(billPaymentEvent.invoice);
    if(result){
      processEventSink.add(BillPamentSuccess());
    }else{
      processEventSink.add(BillPamentFail());
    }
  }


  @override
  void dispose() {
    super.dispose();
  }
}
