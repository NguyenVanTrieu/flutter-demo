
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:flutter/widgets.dart';

class LoginEvent extends BaseEvent {
  String phone;
  String pass;

  LoginEvent({
    @required this.phone,
    @required this.pass,
  });
}
