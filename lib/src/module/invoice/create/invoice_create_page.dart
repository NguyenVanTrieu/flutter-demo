import 'package:demo_flutter_app/src/base/base_widget.dart';
import 'package:demo_flutter_app/src/module/invoice/create/invoice_create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class InvoiceCreateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      title: "Bán hàng",
      providers: [
        ChangeNotifierProvider(builder: (context) => InvoiceCreateBloc()),
      ],
      child: _InvoiceCreateBody(),
    );
  }
}

class _InvoiceCreateBody extends StatefulWidget {
  @override
  __InvoiceCreateBodyState createState() => __InvoiceCreateBodyState();
}

class __InvoiceCreateBodyState extends State<_InvoiceCreateBody> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
