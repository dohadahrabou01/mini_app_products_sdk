import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: "iPhone 15", price: 999.99),
    Product(name: "Samsung Galaxy S24", price: 899.99),
    Product(name: "MacBook Air M2", price: 1299.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste des Produits")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text("${products[index].price} €"),
          );
        },
      ),
    );
  }
}
