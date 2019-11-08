import 'package:demo_flutter_app/src/base/base_widget.dart';
import 'package:demo_flutter_app/src/model/invoice.dart';
import 'package:demo_flutter_app/src/module/invoice/detail/invoice_billing_detail_page.dart';
import 'package:demo_flutter_app/src/module/invoice/list/invoice_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paging/paging.dart';
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
  InvoiceListBloc _invoiceListBloc;

  @override
  Widget build(BuildContext context) {
    _invoiceListBloc = Provider.of<InvoiceListBloc>(context);
    return Container(
      constraints: BoxConstraints.expand(),
      child: Pagination(
        pageBuilder: (currentListSize) => _invoiceListBloc.pageData(currentListSize),
        itemBuilder: (index, item) => _buildRow(item),
      ),
    );
  }

  Widget _buildRow(Invoice invoice) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InvoiceBillingDetailWidget(
              invoiceId: invoice.id,
            ),
          ),
        )
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              invoice.id.substring(invoice.id.length - 8, invoice.id.length),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              invoice.amount.toString(),
              style: TextStyle(fontSize: 16),
            ),
            Container(
              width: 90,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  invoice.regUser != null ? invoice.regUser : "",
                  style: TextStyle(fontSize: 16),
                )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
