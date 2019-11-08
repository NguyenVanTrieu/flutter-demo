import 'package:demo_flutter_app/src/data/storage/secure_storage.dart';
import 'package:demo_flutter_app/src/network/uri_config.dart';
import 'package:demo_flutter_app/src/utils/iist_const.dart';
import 'package:dio/dio.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class IISTClient{

  static BaseOptions _option = BaseOptions(
    baseUrl: UriConfig.URI_BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 5000
  );

  static Dio _dio = Dio(_option);
  Dio get dio => _dio;

  IISTClient._internal(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (Options option) async {
        String jwt = await SecureStorage().storage.read(key: IISTConst.JWT_KEY);
        String token = oauth2.Credentials.fromJson(jwt).accessToken;
        if(token != null){
          option.headers["Authorization"] = "Bearer " + token;
        }
        return option;
      }
    ));
  }

  static final IISTClient _instance = IISTClient._internal();
  factory IISTClient(){
    return _instance;
  }

}