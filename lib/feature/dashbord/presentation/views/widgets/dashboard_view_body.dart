import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/core/widgets/custom_button.dart';
import 'package:fruit_hub_bashbord/feature/dashbord/presentation/views/add_prodact.dart';

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
            Navigator.pushNamed(context, AddProdact.id);
          },
        ),
      ),
    );
  }
}
