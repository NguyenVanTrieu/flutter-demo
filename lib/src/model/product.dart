import 'package:decimal/decimal.dart';

class Product{
  String _id;
  String _name;
  Decimal _price;

  Product(this._id, this._name, this._price);

  Product.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _price = map['price'];
  }

  String get id => _id;
  String get name => _name;
  Decimal get price => _price;

}