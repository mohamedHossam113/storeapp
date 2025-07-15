class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final RatingModel? rating; // Make nullable

  ProductModel({
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    required this.title,
    this.rating, // nullable
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      description: jsonData['description'],
      image: jsonData['image'],
      price: jsonData['price'],
      title: jsonData['title'],
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'])
          : null, // handle missing rating
    );
  }
}

class RatingModel {
  final double rate;
  final double count;
  RatingModel({
    required this.count,
    required this.rate,
  });

  factory RatingModel.fromJson(jsonData) {
    if (jsonData == null) {
      return RatingModel(count: 0, rate: 0); // default values
    }
    return RatingModel(
      count: (jsonData['count'] as num).toDouble(),
      rate: (jsonData['rate'] as num).toDouble(),
    );
  }
}
