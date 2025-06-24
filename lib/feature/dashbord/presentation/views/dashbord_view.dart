import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/feature/dashbord/presentation/views/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const String id = 'dashbord_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DashboardViewBody());
  }
}
