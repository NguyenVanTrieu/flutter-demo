import 'package:demo_flutter_app/src/base/base_widget.dart';
import 'package:demo_flutter_app/src/model/invoice.dart';
import 'package:demo_flutter_app/src/module/invoice/detail/invoice_billing_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoiceBillingDetailWidget extends StatelessWidget {
  final String invoiceId;

  InvoiceBillingDetailWidget({this.invoiceId});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      appBar: AppBar(
        title: Text("Hóa đơn"),
      ),
      providers: [
        Provider(builder: (context) => invoiceId),
        ChangeNotifierProvider(builder: (context) => InvoiceBillingDetailBloc()),
      ],
      child: _InvoiceBillingDetailBody(),
    );
  }
}

class _InvoiceBillingDetailBody extends StatefulWidget {
  @override
  _InvoiceBillingDetailBodyState createState() => _InvoiceBillingDetailBodyState();
}

class _InvoiceBillingDetailBodyState extends State<_InvoiceBillingDetailBody> {

  @override
  Widget build(BuildContext context) {
    String invoiceId = Provider.of<String>(context);
    InvoiceBillingDetailBloc billingDetailBloc = Provider.of<InvoiceBillingDetailBloc>(context);


    return FutureBuilder<Invoice>(
      future: billingDetailBloc.getInvoice(invoiceId),
      builder: (context, snapshot){
        Invoice invoice = snapshot.data;
        return Column(
          children: <Widget>[
            Expanded(
              child: invoice.invoiceDetails != null
                  ? ListView.builder(
                itemCount: invoice.invoiceDetails.length,
                itemBuilder: (context, index) {
                  return _buildRow(invoice.invoiceDetails[index]);
                },
              )
                  : Row(),
            ),
            _buildPaymentWidget(invoice)
          ],
        );
      },
    );

  }

  Widget _buildPaymentWidget(Invoice invoice) {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            invoice.amount.toStringAsFixed(1),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
        ],
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
            Container(
              width: 110,
              child: Text(
                detail.productName,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "x" + detail.quantity.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
              width: 80,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  (detail.quantity * detail.price).toStringAsFixed(1),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
