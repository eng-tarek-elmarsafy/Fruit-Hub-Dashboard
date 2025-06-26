import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit_hub_bashbord/core/service/firebase_firestore_service.dart';
import 'package:meta/meta.dart';

part 'add_proaduct_state.dart';

class AddProaductCubit extends Cubit<AddProaductState> {
  AddProaductCubit(this.firebaseFirestoreService) : super(AddProaductInitial());
  final FirebaseFirestoreService firebaseFirestoreService;
}
