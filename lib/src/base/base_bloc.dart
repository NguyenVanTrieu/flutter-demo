

import 'dart:async';
import 'package:demo_flutter_app/src/base/base_event.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/widgets.dart';

abstract class BaseBloc extends ChangeNotifier{
  StreamController<bool> _loadingStreamController = StreamController<bool>();
  Stream<bool> get loadingStream => _loadingStreamController.stream;
  Sink<bool> get loadingSink => _loadingStreamController.sink;

  StreamController<BaseEvent> _processEventSubject =
  StreamController<BaseEvent>.broadcast();
  Stream<BaseEvent> get processEventStream => _processEventSubject.stream;
  Sink<BaseEvent> get processEventSink => _processEventSubject.sink;

  StreamController<BaseEvent> _eventStreamController =
  BehaviorSubject<BaseEvent>();
  Sink<BaseEvent> get event => _eventStreamController.sink;

  BaseBloc() {
    _eventStreamController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception("Invalid event");
      }

      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event);

  @mustCallSuper
  @override
  void dispose() {
    super.dispose();
    _eventStreamController.close();
    _loadingStreamController.close();
    _processEventSubject.close();
  }
}