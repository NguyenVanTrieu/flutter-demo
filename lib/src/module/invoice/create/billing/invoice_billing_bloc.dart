import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/model/invoice.dart';
import 'package:demo_flutter_app/src/module/invoice/create/event/bill_payment_event.dart';

class InvoiceBillingBloc extends BaseBloc {
  Invoice invoice;

  InvoiceBillingBloc({this.invoice}) {
    invoice = invoice;
  }

  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case BillPaymentEvent:
        handleBillPaymentEvent(event);
        break;
    }
  }

  void handleBillPaymentEvent(BaseEvent event) {
    BillPaymentEvent billPaymentEvent = event as BillPaymentEvent;

  }


  @override
  void dispose() {
    super.dispose();
  }
}
