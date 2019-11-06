import 'dart:async';

import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:demo_flutter_app/src/data/service/auth/auth_service.dart';
import 'package:demo_flutter_app/src/module/login/event/login_event.dart';
import 'package:demo_flutter_app/src/utils/vadidator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BaseBloc {
  final BehaviorSubject<String> _usernameStreamController =
      BehaviorSubject<String>();
  Stream<String> get usernameStream => _usernameStreamController.stream;
  Sink<String> get usernameSink => _usernameStreamController.sink;

  final BehaviorSubject<String> _passStreamController =
      BehaviorSubject<String>();
  Stream<String> get passStream => _passStreamController.stream;

  final _btnStreamController = StreamController<bool>();
  Stream<bool> get btnStream => _btnStreamController.stream;
  Sink<bool> get passSink => _btnStreamController.sink;

  final Authentication _authService = Authentication();

  @override
  void dispatchEvent(BaseEvent event) {
    switch (event.runtimeType) {
      case LoginEvent:
        handleSignIn(event);
        break;
    }
  }

  handleSignIn(LoginEvent event) {
    bool validate = validateForm(event.username, event.pass);

    if (validate) {
      _authService.login(event.username, event.pass).then((success) {
        processEventSink.add(LoginSuccessEvent());
      }, onError: (e) {
        processEventSink.add(LoginFailEvent());
      }).catchError((e) {
        processEventSink.add(LoginFailEvent());
      });
    }
  }

  validateForm(String username, String password) {
    return _phoneValidation(username) & _passwordValidation(password);
  }

  bool _phoneValidation(String phone) {
    if (Validator.isUserName(phone)) {
      _usernameStreamController.sink.add(null);
      return true;
    } else {
      _usernameStreamController.sink.add('Tên người dùng không hợp lệ');
      return false;
    }
  }

  bool _passwordValidation(String password) {
    if (Validator.isPassword(password)) {
      _passStreamController.sink.add(null);
      return true;
    } else {
      _passStreamController.sink.add('Mật khẩu từ 6 kí tự trở lên');
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _btnStreamController.close();
    _passStreamController.close();
    _usernameStreamController.close();
  }
}
