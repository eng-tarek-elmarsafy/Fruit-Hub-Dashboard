import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_bashbord/core/error/failure.dart';
import 'package:fruit_hub_bashbord/core/repos/images_repo/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImages(File image) async {
    throw UnimplementedError();
  }
}
