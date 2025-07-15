import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/services/get_all_products.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
  bool isSearching = false;
  bool filterByPriceAsc = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              isSearching = !isSearching;
            });
          },
          icon: const Icon(Icons.search, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                filterByPriceAsc = !filterByPriceAsc;
              });
            },
            icon: const Icon(Icons.filter_alt, color: Colors.black),
            tooltip: filterByPriceAsc ? 'Sort Descending' : 'Sort Ascending',
          ),
          IconButton(
            onPressed: () {
              log('Cart icon pressed'.toString());
            },
            icon:
                const Icon(FontAwesomeIcons.cartShopping, color: Colors.black),
          ),
          const SizedBox(width: 20),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: isSearching
            ? TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search products...',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              )
            : const Text(
                'True Religion',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 65),
        child: FutureBuilder<List<ProductModel>>(
            future: GetAllProducts().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No products found'));
              }
              List<ProductModel> products = snapshot.data!;
              // Filter by search query
              if (searchQuery.isNotEmpty) {
                products = products
                    .where((product) => product.title
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase()))
                    .toList();
              }
              // Sort by price
              products.sort((a, b) => filterByPriceAsc
                  ? (a.price as num).compareTo(b.price as num)
                  : (b.price as num).compareTo(a.price as num));
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 60),
                itemBuilder: (BuildContext context, int index) {
                  return CustomCard(
                    itemname: products[index].title,
                    price: products[index].price,
                    imageUrl: products[index].image,
                    product: products[index],
                  );
                },
              );
            }),
      ),
    );
  }
}
