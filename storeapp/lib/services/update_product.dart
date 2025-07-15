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
        await Api().put(url: 'https://fakestoreapi.com/products/:id', body: {
      if (title != null) 'title': title,
      if (price != null) 'price': price,
      if (desc != null) 'description': desc,
      if (image != null) 'image': image,
      if (category != null) 'category': category,
    });

    return ProductModel.fromJson(data);
  }
}
