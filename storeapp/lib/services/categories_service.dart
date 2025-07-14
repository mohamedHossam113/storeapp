import 'package:storeapp/api.dart';
import 'package:storeapp/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<ProductModel> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    return data;
  }
}
