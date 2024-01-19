import 'package:dio/dio.dart';
import 'package:eastern_demo/app/models/category_repo_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  CategoryRepoModel? category;
  @override
  void onInit() {
    getCategoryApi();
    super.onInit();
  }

  getCategoryApi() async {
    var dio = Dio();
    try {
      var response = await dio.request(
        'http://app-interview.easyglue.in/category_repository.json',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        category = CategoryRepoModel.fromJson(response.data);
        print(category?.message);
        update();
        // print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print("Error is = $e");
    }
  }
}
