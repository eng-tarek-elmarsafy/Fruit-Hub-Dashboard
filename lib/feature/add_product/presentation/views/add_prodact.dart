import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_bashbord/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_bashbord/core/service/firebase_firestore_service.dart';
import 'package:fruit_hub_bashbord/core/service/get_it_setup.dart';
import 'package:fruit_hub_bashbord/core/widgets/build_app_bar.dart';
import 'package:fruit_hub_bashbord/feature/add_product/presentation/manager/add_proaduct_cubit/add_proaduct_cubit.dart';
import 'package:fruit_hub_bashbord/feature/add_product/presentation/views/widgets/add_prodact_body.dart';

class AddProdact extends StatelessWidget {
  const AddProdact({super.key});
  static const String id = 'add_prodact';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProaductCubit(getIt<FirebaseFirestoreService>(), getIt<ImagesRepo>()),
      child: Scaffold(appBar: buildAppBar(), body: AddProdactBody()),
    );
  }
}
