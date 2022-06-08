// ignore_for_file: non_constant_identifier_names

class Product {
  late int _id;
  late String _name;
  late String _description;
  late double _price;

  Product(this._name, this._description, this._price, this._id);
  Product.withId(this._id, this._name, this._description, this._price);

  int get id => _id;
  String get name => _name;
  String get description => _description;
  double get price => _price;

  set name(String value) {
    if (value.length >= 2) {
      _name = value;
    }
  }

  set description(String value) {
    if (value.length >= 10) {
      _description = value;
    }
  }

  set price(double value) {
    if (value > 0) {
      _price = value;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["description"] = _description;
    map["price"] = _price;
    return map;
  }

  Product.fromObject(dynamic o) {
    this._id = o["İd"];
    this._name = o["Name"];
    this._description = o["Description"];
    this._price = double.tryParse(o["Price"].toString())!;
  }
}
