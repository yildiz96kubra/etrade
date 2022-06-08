// ignore_for_file: unused_local_variable

import 'package:etrade/db/dbHelper.dart';
import 'package:etrade/models/product.dart';
import 'package:etrade/screens/product_Detail.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProductListState();
}

class ProductListState extends State {
  DbHelper dbHelper = DbHelper();
  List<Product>? products;

  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (products == null) {
      // ignore: deprecated_member_use
      products = <Product>[];
    }
    return Scaffold(
      body: ProductListItem(),
    );
  }

  ListView ProductListItem() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.amberAccent,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text("A"),
            ),
            title: Text(this.products![position].name),
            subtitle: Text(this.products![position].description),
            onTap: () {
              GotoDetail(this.products![position]);
            },
          ),
        );
      },
    );
  }

  void getData() {
    var db = dbHelper.initializeDb();
    db.then((result) {
      var productsFuture = dbHelper.getProducts();
      productsFuture.then((data) {
        // ignore: deprecated_member_use, prefer_collection_literals
        List<Product> productsData = <Product>[];
        count = data.length;
        for (var i = 0; i < count; i++) {
          productsData.add(Product.fromObject(data[i]));
        }
        setState(() {
          products = productsData;
          count = count;
        });
      });
    });
  }

  void GotoDetail(Product product) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductDetail()));
  }
}
