import 'package:demo_flutter_app/src/base/base_widget.dart';
import 'package:demo_flutter_app/src/module/login/event/login_event.dart';
import 'package:demo_flutter_app/src/module/login/login_bloc.dart';
import 'package:demo_flutter_app/src/shared/widget/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: LoginPageBody(),
      providers: [
        ChangeNotifierProvider(builder: (context) => LoginBloc()),
      ],
    );
  }
}

class LoginPageBody extends StatefulWidget {
  @override
  _LoginPageBodyState createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {

    loginBloc = Provider.of<LoginBloc>(context);

    return Container(
      constraints: BoxConstraints.expand(),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
//                mainAxisAlignment: MainAxisAlignment.end,
//            crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 140,
                  ),
                  /*Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Image.asset(Images.),
                    ),*/
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
                      child: _buildSignInBtn(),
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
      value: loginBloc.phoneStream,
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

  Widget _buildSignInBtn() {
    return StreamProvider<bool>.value(
      initialData: true,
      value: loginBloc.btnStream,
      child: Consumer<bool>(
        builder: (context, enable, child) => NormalButton(
            title: "Đăng nhập",
            onPressed: !enable
                ? null
                : () {
              onSignInClicked(
                  phone: _userController.text,
                  password: _passController.text);
            }),
      ),
    );
  }

  void onSignInClicked({String phone, String password}) {
    loginBloc.event.add(
      LoginEvent(
        phone: phone,
        pass: password,
      ),
    );
  }
}
