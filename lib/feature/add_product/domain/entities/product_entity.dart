import 'dart:io';

class ProductEntity {
  final String name;
  final String price;
  final String code;
  final String description;
  final File imageFile;
  final bool isFeatured;
  String? imageUrl;

  ProductEntity({
    required this.isFeatured,
    required this.imageFile,
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    this.imageUrl,
  });
}
