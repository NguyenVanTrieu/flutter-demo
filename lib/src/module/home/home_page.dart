import 'package:demo_flutter_app/src/base/base_widget.dart';
import 'package:demo_flutter_app/src/module/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "Home",
      child: Text("Hello world"),
      providers: [
        ChangeNotifierProvider(builder: (context) => LoginBloc()),
      ],
    );
  }
}
