import 'package:fruit_hub_bashbord/feature/add_product/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  factory ReviewModel.fromReviewEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      imageUrl: entity.imageUrl,
      rating: entity.rating,
      date: entity.date,
      reviewDescription: entity.reviewDescription,
    );
  }

  ReviewModel({
    required super.name,
    required super.imageUrl,
    required super.rating,
    required super.date,
    required super.reviewDescription,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: json['rating'] as num,
      date: json['date'] as String,
      reviewDescription: json['reviewDescription'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'rating': rating,
      'date': date,
      'reviewDescription': reviewDescription,
    };
  }
}
