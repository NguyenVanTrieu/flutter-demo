
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:flutter/widgets.dart';

class LoginEvent extends BaseEvent {
  String username;
  String pass;

  LoginEvent({
    @required this.username,
    @required this.pass,
  });
}

class LoginFailEvent extends BaseEvent {

}

class LoginSuccessEvent extends BaseEvent {

}