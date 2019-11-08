import 'package:demo_flutter_app/src/base/base_bloc.dart';
import 'package:demo_flutter_app/src/shared/widget/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseContainer extends StatelessWidget {

  final Widget child;
  final List<SingleChildCloneableWidget> providers;
  final AppBar appBar;

  BaseContainer({this.child, this.providers, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
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
  //  PageContainer({this.title, this.child, this.providers, this.actions});

  // Tạm thời phải truyền baseBloc, do action cũng cần truy cập đến
  // Cần sửa lại cho provider ở lớp cao hơn để action cũng có thể truy cập

  final BaseBloc baseBloc;
  PageContainer({this.title, this.child, this.providers, this.actions, this.baseBloc});


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