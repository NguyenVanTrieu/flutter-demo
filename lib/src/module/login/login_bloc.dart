
import 'dart:async';

import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:rxdart/rxdart.dart';
class LoginBloc extends BaseBloc{

  final BehaviorSubject<String> _phoneStreamController =
  BehaviorSubject<String>();
  Stream<String> get phoneStream => _phoneStreamController.stream;
  Sink<String> get phoneSink => _phoneStreamController.sink;

  final BehaviorSubject<String> _passStreamController =
  BehaviorSubject<String>();
  Stream<String> get passStream => _passStreamController.stream;

  final _btnStreamController = StreamController<bool>();
  Stream<bool> get btnStream => _btnStreamController.stream;
  Sink<bool> get passSink => _btnStreamController.sink;

  @override
  void dispatchEvent(BaseEvent event) {

  }

  @override
  void dispose() {
    super.dispose();
    _btnStreamController.close();
    _passStreamController.close();
    _phoneStreamController.close();
  }
}