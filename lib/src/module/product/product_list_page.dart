import 'package:demo_flutter_app/src/base/base_widget.dart';
import 'package:demo_flutter_app/src/model/product.dart';
import 'package:demo_flutter_app/src/module/product/product_list_bloc.dart';
import 'package:demo_flutter_app/src/shared/widget/message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "Danh sách sản phẩm",
      providers: [
        ChangeNotifierProvider(builder: (context) => ProductListBloc()),
      ],
      child: _ProductListBody(),
    );
  }
}

class _ProductListBody extends StatefulWidget {
  @override
  __ProductListBodyState createState() => __ProductListBodyState();
}

class __ProductListBodyState extends State<_ProductListBody> {
  ProductListBloc _productListBloc;

  @override
  Widget build(BuildContext context) {
    _productListBloc = Provider.of<ProductListBloc>(context);

    return Container(
      constraints: BoxConstraints.expand(),
      child: StreamProvider<dynamic>.value(
          initialData: null,
//          value: _productListBloc.listProductStream,
          value: _productListBloc.getProductList(),
          catchError: (context, error) {
            return error;
          },
          child: Consumer<dynamic>(
            builder: (context, data, child) {
              if(data == null){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(data is List<Product>){
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return _buildRow(data[index]);
                    });
              }

              MessageDialog.showMsgDialog(
                  context, "Thông báo !", "Có lỗi");
              return null;
            },
          )),
    );
  }

  Widget _buildRow(Product product) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              product.name,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              product.price.toString(),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
