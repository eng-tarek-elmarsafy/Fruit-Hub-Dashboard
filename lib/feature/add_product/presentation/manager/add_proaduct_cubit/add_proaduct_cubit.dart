import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub_bashbord/core/error/failure.dart';
import 'package:fruit_hub_bashbord/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_bashbord/core/service/backend_endpoints.dart';
import 'package:fruit_hub_bashbord/core/service/firebase_firestore_service.dart';
import 'package:fruit_hub_bashbord/feature/add_product/data/models/product_model.dart';
import 'package:fruit_hub_bashbord/feature/add_product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'add_proaduct_state.dart';

class AddProaductCubit extends Cubit<AddProaductState> {
  AddProaductCubit(this.firebaseFirestoreService, this.imagesRepo)
    : super(AddProaductInitial());
  final FirebaseFirestoreService firebaseFirestoreService;
  final ImagesRepo imagesRepo;

  Future<void> addProduct(ProductEntity productData) async {
    emit(AddProaductLoading());
    final result = await imagesRepo.uploadImages(
      productData.imageFile,
      BackendEndpoints.addFile,
    );

    result.fold(
      (failure) => emit(AddProaductFailure(message: failure.message)),
      (success) async {
        productData.imageUrl = success;
        final result = await firebaseFirestoreService.addData(
          BackendEndpoints.addProduct,
          null,
          ProductModel.fromEntity(productData).toMap(),
        );
        result.fold(
          (failure) => emit(AddProaductFailure(message: failure.message)),
          (success) => emit(AddProaductSuccess()),
        );
      },
    );
  }
}
