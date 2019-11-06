
import 'package:demo_flutter_app/src/module/home/home_page.dart';
import 'package:demo_flutter_app/src/module/login/login_page.dart';
import 'package:demo_flutter_app/src/module/product/product_list_page.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      home: LoginPage(),
      theme: ThemeData(
//        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => LoginPageWidget(),
        '/product': (context) => ProductListWidget(),
        '/sell': (context) => HomePage(),
      },
    );
  }
}
