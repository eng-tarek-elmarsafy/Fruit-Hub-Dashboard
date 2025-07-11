import 'package:fruit_hub_bashbord/feature/add_product/data/models/review_model.dart';
import 'package:fruit_hub_bashbord/feature/add_product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      price: entity.price,
      code: entity.code,
      description: entity.description,
      imageUrl: entity.imageUrl,
      imageFile: entity.imageFile,
      isFeatured: entity.isFeatured,
      expirationsMonths: entity.expirationsMonths,
      isOrganic: entity.isOrganic,
      numberOfCaloris: entity.numberOfCaloris,
      avgRating: entity.avgRating,
      unitAmount: entity.unitAmount,
      ratingCount: entity.ratingCount,
      review: entity.review,
    );
  }
  ProductModel({
    required super.imageFile,
    required super.name,
    required super.price,
    required super.code,
    required super.description,
    super.imageUrl,
    required super.isFeatured,
    required super.expirationsMonths,
    required super.isOrganic,
    required super.numberOfCaloris,
    super.avgRating = 0,
    super.ratingCount = 0,
    required super.unitAmount,
    required super.review,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'isFeatured': isFeatured,
      'isOrganic': isOrganic,
      'numberOfCaloris': numberOfCaloris,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'unitAmount': unitAmount,
      'expirationsMonths': expirationsMonths,
      'description': description,
      'imageUrl': imageUrl,
      'review':
          review.map((e) => ReviewModel.fromReviewEntity(e).toJson()).toList(),
    };
  }
}
