import 'package:demo_flutter_app/src/base/base_widget.dart';
import 'package:demo_flutter_app/src/module/invoice/list/invoice_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class InvoiceListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "Danh sách hóa đơn",
      providers: [
        ChangeNotifierProvider(builder: (context) => InvoiceListBloc()),
      ],
      child: _InvoiceListBody(),
    );
  }
}

class _InvoiceListBody extends StatefulWidget {
  @override
  _InvoiceListBodyState createState() => _InvoiceListBodyState();
}

class _InvoiceListBodyState extends State<_InvoiceListBody> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
