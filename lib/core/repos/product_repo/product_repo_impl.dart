import 'package:dartz/dartz.dart';
import 'package:fruit_hub_bashbord/core/error/failure.dart';
import 'package:fruit_hub_bashbord/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_bashbord/core/service/backend_endpoints.dart';
import 'package:fruit_hub_bashbord/core/service/firebase_firestore_service.dart';
import 'package:fruit_hub_bashbord/feature/add_product/data/models/product_model.dart';
import 'package:fruit_hub_bashbord/feature/add_product/domain/entities/product_entity.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl({required this.firebaseFirestoreService});
  final FirebaseFirestoreService firebaseFirestoreService;

  @override
  Future<Either<Failure, void>> addProducts(ProductEntity productEntity) async {
    try {
      await firebaseFirestoreService.addData(
        BackendEndpoints.addProduct,
        null,
        ProductModel.fromEntity(productEntity).toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
