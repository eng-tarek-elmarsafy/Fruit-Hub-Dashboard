import 'package:dartz/dartz.dart';
import 'package:fruit_hub_bashbord/core/error/failure.dart';
import 'package:fruit_hub_bashbord/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_bashbord/feature/add_product/domain/entities/product_entity.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failure, void>> getProducts(ProductEntity productEntity) async {
    throw UnimplementedError();
  }
}
