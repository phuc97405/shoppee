import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppee/presentasion/My_App/wrapper.dart';
import 'package:shoppee/presentasion/My_App/wrapper_bingding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: WrapperBingding(),
      home: WrapperScreen(),
    );
  }
}
