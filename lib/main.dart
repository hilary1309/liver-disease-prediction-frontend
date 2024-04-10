import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
//import 'package:ldp_prediction/components/bottom_nav_component.dart';
import 'package:ldp_prediction/features/root/root_screen.dart';
//import 'package:ldp_prediction/features/home/home_screen.dart';
import 'package:ldp_prediction/services/provider.dart';
import 'package:ldp_prediction/shared/locator.dart';
import 'package:ldp_prediction/utils/sizeConfig.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();

  runApp(MultiProvider(providers: AppProviders.providers, child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Liver Disease Prediction App',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      //home: const BottomNavComponent(),
      home: const RootPage(),
    );
  }
}
