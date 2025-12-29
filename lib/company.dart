import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:qwee/views/company_list.dart';

class Company_card_name extends StatelessWidget {
  Company_card_name({super.key});
  final box = GetStorage();
  void onetime_click() {
    // Get.offAll(() box.write('onetime', true));
    box.write('onetime', true);
    Get.offAll(CompanyList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Company',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        //  ,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Image.asset('assets/download_3.png'),
              SizedBox(height: 270),
              Text(
                'Find your Dream Company',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: onetime_click,
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
