import 'package:demo_flutter_app/src/base/base_widget.dart';
import 'package:demo_flutter_app/src/model/invoice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoiceBillingWidget extends StatelessWidget {
  final Invoice invoice;

  InvoiceBillingWidget({this.invoice});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      appBar: AppBar(
        title: Text("Hóa đơn"),
      ),
      providers: [
        Provider(builder: (context) => invoice),
      ],
      child: _InvoiceBillingBody(),
    );
  }
}

class _InvoiceBillingBody extends StatefulWidget {
  @override
  _InvoiceBillingBodyState createState() => _InvoiceBillingBodyState();
}

class _InvoiceBillingBodyState extends State<_InvoiceBillingBody> {
  Invoice invoice;
  @override
  Widget build(BuildContext context) {
    invoice = Provider.of<Invoice>(context);

    return Container(
      constraints: BoxConstraints.expand(),
      child: ListView.builder(
        itemCount: invoice.details.length,
        itemBuilder: (context, index) {
          return _buildRow(invoice.details[index]);
        },
      ),
    );
  }

  Widget _buildRow(InvoiceDetail detail) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              detail.productName,
              style: TextStyle(fontSize: 16),
            ),

            Text(
              "x" + detail.quantity.toString(),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              (detail.quantity * detail.price).toStringAsFixed(1),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
