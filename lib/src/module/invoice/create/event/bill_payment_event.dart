import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/model/invoice.dart';

class BillPaymentEvent extends BaseEvent{
  final Invoice invoice;
  BillPaymentEvent({this.invoice});
}

class BillPamentSuccess extends BaseEvent{

}

class BillPamentFail extends BaseEvent{

}