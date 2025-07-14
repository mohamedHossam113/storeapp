import 'package:storeapp/api.dart';

class DeleteProduct {
  Future<void> deleteProduct(String id) async {
    await Api().delete(url: 'https://fakestoreapi.com/products/$id');
  }
}
