import 'package:demo_flutter_app/src/shared/widget/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseContainer extends StatelessWidget {

  final Widget child;
  final List<SingleChildCloneableWidget> providers;

  BaseContainer({this.child, this.providers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: MultiProvider(
        providers: providers,
        child: child,
      ),
    );
  }
}

class PageContainer extends StatelessWidget{

  final Widget child;
  final List<SingleChildCloneableWidget> providers;
  final String title;
  final List<Widget> actions;
  PageContainer({this.title, this.child, this.providers, this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiProvider(
        providers: providers,
        child: child,
      ),
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        actions: actions,
      ),
      drawer: DrawerMenu(),
    );
  }
}