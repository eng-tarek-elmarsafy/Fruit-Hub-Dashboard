import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_bashbord/core/service/upload_file.dart';
import 'package:path/path.dart' as p;

class UploadFileServiceImpl implements UploadFileService {
  @override
  Future<String> uploadFile(File file, String path) async {
    final fileName = p.basename(file.path);
    final fileExtension = p.extension(file.path);
    final storageRef = FirebaseStorage.instance.ref();
    final mountainImageRef = storageRef.child(
      '$path/$fileName.$fileExtension',
    );

    await mountainImageRef.putFile(file);

    final downloadUrl = await mountainImageRef.getDownloadURL();
    return downloadUrl;
  }
}
