import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{

  static final FlutterSecureStorage _storage = new FlutterSecureStorage();
  FlutterSecureStorage get storage => _storage;

  SecureStorage._internal();
  static final SecureStorage _instance = SecureStorage._internal();

 factory SecureStorage(){
  return _instance;
 }

}