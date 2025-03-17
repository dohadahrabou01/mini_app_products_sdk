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
      appBar: AppBar(
        title: Text(
          "Liste des Produits",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                leading: Icon(Icons.shopping_cart, color: Colors.deepPurple, size: 30),
                title: Text(
                  products[index].name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${products[index].price.toStringAsFixed(2)} €",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                onTap: () {
                  // Action lors du clic sur un produit
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Produit sélectionné: ${products[index].name}")),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
