import 'package:get/get.dart';
import 'package:qwee/services/api_servie.dart';
import '../models/company_model.dart';
import '../services/api_servie.dart';

class CompanyController extends GetxController {
  final Company_service service = Company_service();

  var companies = <Company>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  Future<void> fetchCompanies() async {
    try {
      isLoading.value = true;
      final result = await service.fetchCompanies();
      companies.value = result;
    } catch (e) {
      errorMessage.value = 'Failed to load companies';
    } finally {
      isLoading.value = false;
    }
  }
}
