

class ReviewModel {
  final String id;
  final String userName;
  final String? userAvatar; // Может быть null, если нет фото
  final double rating;
  final String comment;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
    required this.userName,
    this.userAvatar,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  // Превращаем JSON из Supabase в объект Dart
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] as String,
      userName: json['user_name'] ?? 'Anonymous',
      userAvatar: json['user_avatar'], // Ссылка на изображение в Storage
      // Приводим к double, так как из базы может прийти int или float
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] ?? '',
      // Парсим строку даты в объект DateTime
      createdAt: DateTime.parse(json['created_at']),
    );
  }

}