

class Product {
  final String id;
  final DateTime createdAt;
  final String title;
  final double price;
  final String currency;
  final String? imageUrl;
  final bool isAvailable;

  Product({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.price,
    required this.currency,
    this.imageUrl,
    this.isAvailable = true,
  });

  // Превращаем JSON из Supabase в объект Dart
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      title: json['title'],
      // Supabase возвращает numeric как double или int
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] ?? 'KZT',
      imageUrl: json['image_url'],
      isAvailable: json['is_available'] ?? true,
    );
  }

  // Превращаем объект Dart в JSON для записи в базу
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'currency': currency,
      'image_url': imageUrl,
      'is_available': isAvailable,
    };
  }
}