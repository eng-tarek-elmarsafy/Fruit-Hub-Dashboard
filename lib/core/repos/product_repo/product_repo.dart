import 'package:dartz/dartz.dart';
import 'package:fruit_hub_bashbord/core/error/failure.dart';
import 'package:fruit_hub_bashbord/feature/add_product/domain/entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProducts(ProductEntity productEntity);
}
