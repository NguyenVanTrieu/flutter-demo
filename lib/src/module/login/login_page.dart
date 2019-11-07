import 'package:demo_flutter_app/src/base/base_widget.dart';
import 'package:demo_flutter_app/src/module/login/event/login_event.dart';
import 'package:demo_flutter_app/src/module/login/login_bloc.dart';
import 'package:demo_flutter_app/src/shared/widget/message_dialog.dart';
import 'package:demo_flutter_app/src/shared/widget/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: _LoginPageBody(),
      providers: [
        ChangeNotifierProvider(builder: (context) => LoginBloc()),
      ],
    );
  }
}

class _LoginPageBody extends StatefulWidget {
  @override
  _LoginPageBodyState createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<_LoginPageBody> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    loginBloc = Provider.of<LoginBloc>(context);

    loginBloc.processEventStream.listen((event) {
      if (event is LoginSuccessEvent) {
        Navigator.pushReplacementNamed(context, '/sell');
      }

      if (event is LoginFailEvent) {
        MessageDialog.showMsgDialog(
            context, "Thông báo !", "Sai mật khẩu hoặc tài khoản");
      }
    });

    return Container(
      constraints: BoxConstraints.expand(),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 140,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                    child: Container(
                      height: 80,
                      width: 80,
                      child: FlutterLogo(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: _buildUserField(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: _buildPassField(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: _buildLoginBtn(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
            )
          ],
        )),
      ),
    );
  }

  Widget _buildUserField() {
    return StreamProvider<String>.value(
      initialData: null,
      value: loginBloc.usernameStream,
      child: Consumer<String>(
        builder: (context, msg, child) => TextField(
          controller: _userController,
//          keyboardType: TextInputType.phone,
          style: TextStyle(fontSize: 16, color: Colors.black),
          decoration: InputDecoration(
              labelText: "Tài khoản",
              errorText: msg == null || msg.isEmpty ? null : msg,
              labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
              prefixIcon: Container(
                width: 50,
                child: Icon(Icons.account_circle),
              ),
              border: OutlineInputBorder()),
        ),
      ),
    );
  }

  Widget _buildPassField() {
    return StreamProvider<String>.value(
      initialData: null,
      value: loginBloc.passStream,
      child: Consumer<String>(
        builder: (context, msg, child) => TextField(
          controller: _passController,
//          obscureText: !_showPass,
          obscureText: true,
          style: TextStyle(fontSize: 16, color: Colors.black),
          decoration: InputDecoration(
              labelText: "Mật khẩu",
              errorText: msg == null || msg.isEmpty ? null : msg,
              labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
              prefixIcon: Container(
                width: 50,
                child: Icon(Icons.lock_outline),
              ),
              border: OutlineInputBorder()),
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return StreamProvider<bool>.value(
      initialData: true,
      value: loginBloc.btnStream,
      child: Consumer<bool>(
        builder: (context, enable, child) => NormalButton(
            title: "Đăng nhập",
            onPressed: !enable
                ? null
                : () {
                    onLoginClicked(
                        username: _userController.text,
                        password: _passController.text);
                  }),
      ),
    );
  }

  void onLoginClicked({String username, String password}) {
    loginBloc.event.add(
      LoginEvent(
        username: username,
        pass: password,
      ),
    );
  }
}
