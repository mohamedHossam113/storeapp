import 'package:flutter/material.dart';
import 'package:storeapp/models/product_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, this.itemname, this.price, this.imageUrl, this.product});
  final String? itemname;
  final dynamic price;
  final String? imageUrl;
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 300,
          width: 300,
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.title.substring(0, 12),
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' \$ ${product!.price}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 32,
            left: 32,
            bottom: 90,
            child: Image.network(
              product!.image,
              height: 145,
            )),
      ],
    );
  }
}
