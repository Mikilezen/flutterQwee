import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qwee/company.dart';
import 'package:qwee/controllers/bookmar_controller.dart';
import 'package:qwee/controllers/company_controller.dart';
import 'package:qwee/views/company_list.dart';
import 'views/company_list.dart';
import 'package:get_storage/get_storage.dart';
import 'views/feedback_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final box = GetStorage();
  await GetStorage.init();
  box.writeIfNull('onetime', false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Company Finder',
      theme: ThemeData.dark().copyWith(),
      home: box.read('onetime') ? CompanyList() : Company_card_name(),
    );
  }
}
