import 'package:fruit_hub_bashbord/feature/add_product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.imageFile,
    required super.name,
    required super.price,
    required super.code,
    required super.description,
    super.imageUrl,
    required super.isFeatured,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      code: json['code'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      imageFile: json['imageFile'],
      isFeatured: json['isFeatured'] ?? false,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      price: map['price'],
      code: map['code'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      imageFile: map['imageFile'],
      isFeatured: map['isFeatured'] ?? false,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      price: entity.price,
      code: entity.code,
      description: entity.description,
      imageUrl: entity.imageUrl,
      imageFile: entity.imageFile,
      isFeatured: entity.isFeatured,
    );
  }
}
