import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_playground/ui/screen/list_with_api/product_list/product_item.dart';

import '../../../../data/model/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  String generateRandomAmount() {
    double min = 10.0;
    double max = 100.0;
    return (min + Random().nextDouble() * (max - min)).toStringAsFixed(2);
  }

  void showToast(String? message) {
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> items = List.generate(
      20,
      (index) => Product(
        id: index + 1,
        name: "Product ${index + 1}",
        description: "Description ${index + 1}",
        price: generateRandomAmount(),
        image: "iphone.webp",
      ),
    );

    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ProductItem(
          product: items[index],
          onTap: () {
            print('Clicked: ${items[index].id}');
            showToast("Clicked: ${items[index].id}");
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey,
          thickness: 1,
        );
      },
    );
  }
}
