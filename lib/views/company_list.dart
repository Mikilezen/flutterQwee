import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qwee/controllers/bookmar_controller.dart';
import 'package:qwee/views/bookmark_page.dart';
import 'package:qwee/views/company_detail.dart';
import '../controllers/company_controller.dart';
import 'dart:math';
import '../controllers/icon_list.dart';

class CompanyList extends StatelessWidget {
  CompanyList({super.key});

  final CompanyController controller = Get.put(CompanyController());
  final BookmarkController bookmarkController = Get.put(BookmarkController());
  final RandomThing randomThing = RandomThing();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Company',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Badge(
                backgroundColor: Colors.red,
                label: Text('${bookmarkController.bookmarks.length}'),
                child: IconButton(
                  icon: const Icon(Icons.bookmark),
                  onPressed: () {
                    Get.to(() => Bookmark_page());
                  },
                ),
              ),
            ),
          ),
        ],
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
                backgroundColor: randomThing.colorByIndex(index),
                child: Image.asset(randomThing.imageByIndex(index), width: 24),
              ),
              title: Text(company.name),
              subtitle: Text(company.industry),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.bookmark_add),
                    onPressed: () {
                      bookmarkController.addBookmark(company);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      Get.to(() => CompanyDetailScreen(company: company));
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
