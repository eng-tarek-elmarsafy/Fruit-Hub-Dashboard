import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/core/helper/on_generate_route_function.dart';
import 'package:fruit_hub_bashbord/core/service/get_it_setup.dart';
import 'package:fruit_hub_bashbord/feature/dashbord/presentation/views/dashbord_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.id,
    );
  }
}
