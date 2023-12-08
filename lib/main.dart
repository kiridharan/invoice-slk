import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/features/home/controller/home_controller.dart';
import 'package:invoice/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BQS Surveyor',
      initialRoute: AppPages.dashboard,
      getPages: AppPages.routes,
    );
  }
}
