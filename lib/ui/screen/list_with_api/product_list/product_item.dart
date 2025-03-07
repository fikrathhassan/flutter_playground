import 'package:flutter/material.dart';

import '../../../../data/model/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, required this.onTap});

  final Product product;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "assets/images/${product.image}",
                height: 100,
                width: 80,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        product.name ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(product.description ?? ""),
                      Text("Price: ${product.price.toString()}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
