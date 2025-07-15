import 'package:storeapp/api.dart';
import 'package:storeapp/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct(
      {String? title,
      String? price,
      String? desc,
      String? image,
      String? category}) async {
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });

    return ProductModel.fromJson(data);
  }
}
