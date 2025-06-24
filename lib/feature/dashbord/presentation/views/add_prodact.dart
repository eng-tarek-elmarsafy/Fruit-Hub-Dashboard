import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/core/widgets/build_app_bar.dart';
import 'package:fruit_hub_bashbord/feature/dashbord/presentation/views/widgets/add_prodact_body.dart';

class AddProdact extends StatelessWidget {
  const AddProdact({super.key});
  static const String id = 'add_prodact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: AddProdactBody(),
    );
  }

 
}
