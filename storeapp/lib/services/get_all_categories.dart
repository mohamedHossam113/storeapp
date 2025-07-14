import 'package:storeapp/api.dart';

class GetAllCategories {
  Future<List<dynamic>> getAllcategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
