import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_bashbord/core/error/failure.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImages(File image);
}
