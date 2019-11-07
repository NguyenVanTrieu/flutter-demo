import 'package:uuid/uuid.dart';

class IdHelper{

  static String genId(){
    return Uuid().v1();
  }
}