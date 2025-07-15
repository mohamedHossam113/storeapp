import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/custom_button.dart';
import 'package:storeapp/services/custom_textfield.dart';
import 'package:storeapp/services/update_product.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String? id = 'Update Product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;
  bool isLoading = false;
  dynamic price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Update Product',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
        ),
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Column(
            children: [
              CustomTextfield(
                onChanged: (data) {
                  productName = data;
                },
                hintText: 'Product name',
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                onChanged: (data) {
                  desc = data;
                },
                hintText: 'Description',
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                onChanged: (data) {
                  price = data;
                },
                hintText: 'Price',
              ),
              const SizedBox(height: 10),
              CustomTextfield(
                onChanged: (data) {
                  image = data;
                },
                hintText: 'Image',
              ),
              const SizedBox(height: 150),
              MyButton(
                text: 'Update Product',
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    updateProduct(product);
                    log('success'.toString());
                  } catch (e) {
                    log(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateProduct(ProductModel product) {
    UpdateProduct().updateProduct(
      title: productName == null ? product.title : productName!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      price: price == null ? product.price : price!,
    );
  }
}
