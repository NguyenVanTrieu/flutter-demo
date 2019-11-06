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

class PageContainer extends BaseContainer{
  final String title;
  final List<Widget> actions;
  PageContainer({this.title, child, providers, this.actions});

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
      ),
      drawer: null,
    );
  }
}