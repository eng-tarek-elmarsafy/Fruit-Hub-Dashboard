import 'package:dartz/dartz.dart';
import 'package:fruit_hub_bashbord/core/error/failure.dart';

abstract class FirebaseFirestoreService {
  Future<Either<Failure, void>> addData(String path, String? uId, Map<String, dynamic> data);
  Future<Map<String, dynamic>> getData(String path, String uId);

  Future<bool> checkIfDataExists(String path, String uId);
}
