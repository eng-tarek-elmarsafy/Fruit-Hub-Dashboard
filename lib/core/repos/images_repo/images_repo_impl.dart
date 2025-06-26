import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_bashbord/core/error/failure.dart';
import 'package:fruit_hub_bashbord/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_bashbord/core/service/upload_file.dart';

class ImagesRepoImpl implements ImagesRepo {
  final UploadFileService uploadFileService;

  ImagesRepoImpl({required this.uploadFileService});
  @override
  Future<Either<Failure, String>> uploadImages(File image) async {
    try {
      final downloadUrl = await uploadFileService.uploadFile(image, 'images');
      return Right(downloadUrl);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
