import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/core/widgets/custom_button.dart';
import 'package:fruit_hub_bashbord/feature/add_product/presentation/views/add_prodact_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: CustomButton(
          title: 'Add Prodact',
          onPressed: () {
            Navigator.pushNamed(context, AddProdactView.id);
          },
        ),
      ),
    );
  }
}
