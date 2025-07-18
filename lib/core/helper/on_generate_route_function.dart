import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/feature/add_product/presentation/views/add_prodact_view.dart';
import 'package:fruit_hub_bashbord/feature/dashbord/presentation/views/dashbord_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case DashboardView.id:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    case AddProdactView.id:
      return MaterialPageRoute(builder: (context) => const AddProdactView());

    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text('Route not found'))),
      );
  }
}
