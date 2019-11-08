import 'package:demo_flutter_app/src/base/base_widget.dart';
import 'package:demo_flutter_app/src/model/product.dart';
import 'package:demo_flutter_app/src/module/invoice/create/event/pick_product_event.dart';
import 'package:demo_flutter_app/src/module/invoice/create/billing/invoice_billing_page.dart';
import 'package:demo_flutter_app/src/module/invoice/create/invoice_create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paging/paging.dart';

class InvoiceCreateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    InvoiceCreateBloc baseBloc = InvoiceCreateBloc();

    return PageContainer(
      title: "Bán hàng",
      providers: [
        ChangeNotifierProvider(builder: (context) => baseBloc),
      ],
      child: _InvoiceCreateBody(),
      baseBloc: baseBloc,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.shopping_cart), onPressed: () => {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => InvoiceBillingWidget(invoice: baseBloc.invoice,),
          ),)
        }),
      ],
    );
  }
}

class _InvoiceCreateBody extends StatefulWidget {
  @override
  __InvoiceCreateBodyState createState() => __InvoiceCreateBodyState();
}

class __InvoiceCreateBodyState extends State<_InvoiceCreateBody> {

  InvoiceCreateBloc _invoiceCreateBloc;
  @override
  Widget build(BuildContext context) {

    _invoiceCreateBloc = Provider.of<InvoiceCreateBloc>(context);

    return Container(
      constraints: BoxConstraints.expand(),
      child: Pagination(
        pageBuilder: (currentListSize) => _invoiceCreateBloc.pageProducts(currentListSize),
        itemBuilder: (index, item) => _buildRow(item),
      ),
    );
  }

  Widget _buildRow(Product product) {
    return InkWell(
      onTap: () {
        onPickProduct(product: product);
      },
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

  void onPickProduct({Product product}) {

    _invoiceCreateBloc.event.add(

      PickProductEvent(
       product: product
      ),
    );
  }
}
