import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_bashbord/core/service/firebase_firestore_service.dart';

class FirebaseFirestoreServiceImpl implements FirebaseFirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
    String path,
    String? uId,
    Map<String, dynamic> data,
  ) async {
    // final FirebaseFirestore firestore = FirebaseFirestore.instance;
    if (uId != null) {
      await firestore.collection(path).doc(uId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(String path, String uId) async {
    // final FirebaseFirestore firestore = FirebaseFirestore.instance;
    var data = await firestore.collection(path).doc(uId).get();

    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists(String path, String uId) async {
    var data = await firestore.collection(path).doc(uId).get();
    return data.exists;
  }
}
