class ProductsModel {
  final int id;
  final bool isLike;
  final String imageUrl;
  final String name;
  final int price;

  ProductsModel({
    required this.id,
    required this.isLike,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'] ?? 'id',
      isLike: json['is_like'] ?? false,
      imageUrl: json['image_url'] ?? 'image_url',
      name: json['name'] ?? 'name',
      price: json['price'] ?? 12,
    );
  }
}
