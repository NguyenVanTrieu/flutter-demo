import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/model/product.dart';

class PickProductEvent extends BaseEvent{
  Product product;
  PickProductEvent({this.product});
}