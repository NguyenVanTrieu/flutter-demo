
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
        '/': (context) => null,
        '/sign-in': (context) => null,
        '/home': (context) => null,
      },
    );
  }
}
