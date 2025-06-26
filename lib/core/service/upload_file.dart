import 'dart:io';

abstract class UploadFileService {
  Future<String> uploadFile(File file, String path);
}