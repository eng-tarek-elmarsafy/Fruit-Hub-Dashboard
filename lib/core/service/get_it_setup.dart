import 'package:fruit_hub_bashbord/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_bashbord/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruit_hub_bashbord/core/service/firebase_firestore_impl.dart';
import 'package:fruit_hub_bashbord/core/service/firebase_firestore_service.dart';
import 'package:fruit_hub_bashbord/core/service/upload_file_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(
    uploadFileService: UploadFileServiceImpl()
  ));
  getIt.registerSingleton<FirebaseFirestoreService>(FirebaseFirestoreServiceImpl());
}
