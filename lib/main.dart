import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qwee/views/company_list.dart';
import 'views/company_list.dart';

import 'views/feedback_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/feedback', page: () => const FeedbackScreen()),
      ],

      debugShowCheckedModeBanner: false,
      title: 'Company Directory',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CompanyList(),
    );
  }
}
