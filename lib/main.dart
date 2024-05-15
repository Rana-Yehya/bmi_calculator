import 'package:bmi_calculator/controller/custom_root_bindings.dart';
import 'package:bmi_calculator/screens/collecting_data_screen.dart';
import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: CustomRootBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => CollectingDataScreen(),
        '/results': (context) => ResultsScreen(),
      },
      //home: const CollectingDataScreen(),
    );
  }
}
