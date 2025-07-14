import 'package:storeapp/api.dart';
import 'package:storeapp/models/product_model.dart';

class GetAllProducts {
  Future<List<ProductModel>> getAllProducts() async {
    final data = await Api().get(url: 'https://fakestoreapi.com/products');
    return (data as List).map((item) => ProductModel.fromJson(item)).toList();
  }
}
