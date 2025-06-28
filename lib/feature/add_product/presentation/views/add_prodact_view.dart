import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_bashbord/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_bashbord/core/repos/product_repo/product_repo.dart';
import 'package:fruit_hub_bashbord/core/service/get_it_setup.dart';
import 'package:fruit_hub_bashbord/core/utils/app_style.dart';
import 'package:fruit_hub_bashbord/core/widgets/build_app_bar.dart';
import 'package:fruit_hub_bashbord/feature/add_product/presentation/manager/add_proaduct_cubit/add_proaduct_cubit.dart';
import 'package:fruit_hub_bashbord/feature/add_product/presentation/views/widgets/add_prodact_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProdactView extends StatelessWidget {
  const AddProdactView({super.key});
  static const String id = 'add_prodact';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              AddProaductCubit(getIt<ImagesRepo>(), getIt<ProductRepo>()),
      child: Scaffold(appBar: buildAppBar(), body: AddProaductBlocConsumer()),
    );
  }
}

class AddProaductBlocConsumer extends StatelessWidget {
  const AddProaductBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProaductCubit, AddProaductState>(
      listener: (context, state) {
        if (state is AddProaductFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('حدث خطأ', style: AppStyle.basaRegular)),
          );
        }
        if (state is AddProaductSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تمت العملية بنجاح', style: AppStyle.basaRegular),
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProaductLoading,
          child: AddProdactBody(),
        );
      },
    );
  }
}
