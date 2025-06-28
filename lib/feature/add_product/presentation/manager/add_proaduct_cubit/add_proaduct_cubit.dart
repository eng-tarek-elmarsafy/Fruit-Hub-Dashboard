import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_bashbord/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_bashbord/core/service/backend_endpoints.dart';
import 'package:fruit_hub_bashbord/feature/add_product/domain/entities/product_entity.dart';

part 'add_proaduct_state.dart';

class AddProaductCubit extends Cubit<AddProaductState> {
  AddProaductCubit(this.imagesRepo, this.productRepo)
    : super(AddProaductInitial());
  final ImagesRepo imagesRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(ProductEntity productData) async {
    emit(AddProaductLoading());
    final result = await imagesRepo.uploadImages(
      productData.imageFile,
      BackendEndpoints.addFile,
    );

    result.fold((err) => emit(AddProaductFailure(message: err.message)), (
      success,
    ) async {
      productData.imageUrl = success;
      var result = await productRepo.addProducts(productData);
      result.fold(
        (err) => emit(AddProaductFailure(message: err.message)),
        (success) => emit(AddProaductSuccess()),
      );
    });
  }
}
