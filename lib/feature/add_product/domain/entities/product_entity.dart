import 'dart:io';

class ProductEntity {
  final String name;
  final String price;
  final String code;
  final String description;
  final File imageFile;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCaloris;
  final num avgRating;
  final num ratingCount;
  final num unitAmount;

  ProductEntity({
    required this.isFeatured,
    required this.imageFile,
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCaloris,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.unitAmount,
  });
}
