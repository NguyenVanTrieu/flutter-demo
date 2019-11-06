import 'package:demo_flutter_app/src/base/base_widget.dart';
import 'package:demo_flutter_app/src/module/product/product_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "Home",
      providers: [
        ChangeNotifierProvider(builder: (context) => ProductListBloc()),
      ],
      child: _ProductListBody(),
    );
  }
}

class _ProductListBody extends StatelessWidget {
  final List<String> _products = [
    "1",
    "2",
    "3",
    "1",
    "2",
    "3",
    "1",
    "2",
    "3",
    "1",
    "2",
    "3",
    "1",
    "2",
    "3"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return _buildRow(_products[index], index);
        },
      ),
    );
  }

  Widget _buildRow(var product, var index) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              product,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              index.toString(),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
