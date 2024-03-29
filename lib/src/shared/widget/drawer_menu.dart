import 'package:demo_flutter_app/src/data/storage/secure_storage.dart';
import 'package:demo_flutter_app/src/utils/iist_const.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("IIST"),
            currentAccountPicture: Image.network("https://iist.com.vn/wp-content/uploads/2018/09/Logo-IIST-e1537931075520.png"),
          ),
          ListTile(
            onTap: (){
              Navigator.pushReplacementNamed(context, '/sell');
            },
            title: Text("Bán hàng"),
            leading: Icon(Icons.file_upload),
          ),
          ListTile(
            onTap: (){
              Navigator.pushReplacementNamed(context, '/invoice');
            },
            title: Text("Hóa đơn"),
            leading: Icon(Icons.view_headline),
          ),
          ListTile(
            onTap: (){
              Navigator.pushReplacementNamed(context, '/product');
            },
            title: Text("Sản phẩm"),
            leading: Icon(Icons.photo_camera),
          ),
          Divider(

          ),
          ListTile(
            onTap: (){
              SecureStorage().storage.delete(key: IISTConst.JWT_KEY);
              Navigator.pushReplacementNamed(context, '/');
            },
            title: Text("Đăng xuất"),
            leading: Icon(Icons.exit_to_app),
          )

        ],
      ),
    );
  }
}
