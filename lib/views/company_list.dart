import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qwee/views/company_detail.dart';
import '../controllers/company_controller.dart';

class CompanyList extends StatelessWidget {
  CompanyList({super.key});

  final CompanyController controller = Get.put(CompanyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 234, 215),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 244, 204),
        title: const Text(
          'Comp',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return ListView.builder(
          itemCount: controller.companies.length,
          itemBuilder: (context, index) {
            final company = controller.companies[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(company.name[0]),
                backgroundColor: Colors.black,
              ),
              title: Text(company.name),
              subtitle: Text(company.industry),
              trailing: const Icon(Icons.arrow_forward_ios),
              // onTap: () {},
              onTap: () {
                Get.to(() => CompanyDetailScreen(company: company));
              },
            );
          },
        );
      }),
    );
  }
}
