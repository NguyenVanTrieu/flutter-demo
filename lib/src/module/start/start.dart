
import 'package:demo_flutter_app/src/data/storage/secure_storage.dart';
import 'package:demo_flutter_app/src/utils/iist_const.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:flutter/material.dart';

class StartAppWidget extends StatefulWidget {
  @override
  _StartAppWidgetState createState() => _StartAppWidgetState();
}

class _StartAppWidgetState extends State<StartAppWidget> {
  @override
  void initState() {
    _startApp();
    super.initState();
  }

  void _startApp() async{
    try{
      String jwt = await SecureStorage().storage.read(key: IISTConst.JWT_KEY);
      var credential = oauth2.Credentials.fromJson(jwt);

      if (credential != null && !credential.isExpired) {
        Navigator.pushReplacementNamed(context, '/sell');
        return;
      }
      Navigator.pushReplacementNamed(context, '/login');
    }catch(e){
      Navigator.pushReplacementNamed(context, '/login');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
