import 'package:dio/dio.dart';
import 'package:eastern_demo/app/models/bottom_repo_Model.dart';
import 'package:eastern_demo/app/models/category_repo_model.dart';
import 'package:eastern_demo/app/models/middle_repo_model.dart';
import 'package:eastern_demo/app/models/top_repo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  CategoryRepoModel? category;
  TopRepoModel? topRepo;
  MiddleRepoModel? middleRepo;
  BottomRepoModel? bottomRepo;
  SliderImages? sliderImages;
  List<Widget> imgList = [];
  List<Widget> unstitched = [];
  Gallery3DController? imageController;
  @override
  void onInit() {
    getCategoryApi();
    getTopRepo();
    getMiddleRepo();
    getBottomRepo();
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

  getTopRepo() async {
    var dio = Dio();
    try {
      var response = await dio.request(
        'http://app-interview.easyglue.in/top_repository.json',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        topRepo = TopRepoModel.fromJson(response.data);
        if (category != null) {
          for (var i = 0; i < topRepo!.mainStickyMenu!.length; i++) {
            sliderImages = topRepo!.mainStickyMenu![0].sliderImages![i];
            imgList.add(
              Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(topRepo!.mainStickyMenu![0].sliderImages![i].image!),
                        fit: BoxFit.cover,
                      )),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60.h,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        children: [
                          Text(
                            topRepo!.mainStickyMenu![0].sliderImages![i].title!,
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            topRepo!.mainStickyMenu![0].sliderImages![i].cta!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  )),
            );
          }
          update();
        }
        print("toprepo == ${topRepo?.message}");
        update();
        // print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print("Error is = $e");
    }
  }

  getMiddleRepo() async {
    var dio = Dio();
    try {
      var response = await dio.request(
        'http://app-interview.easyglue.in/middle_repository.json',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        middleRepo = MiddleRepoModel.fromJson(response.data);
        imageController = Gallery3DController(
          itemCount: middleRepo!.unstitched!.length,
          autoLoop: true,
          ellipseHeight: 0,
          minScale: 0.4,
        );

        print(topRepo?.message);
        update();
        // print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print("Error is = $e");
    }
  }

  getBottomRepo() async {
    var dio = Dio();
    try {
      var response = await dio.request(
        'http://app-interview.easyglue.in/bottom_repository.json',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        bottomRepo = BottomRepoModel.fromJson(response.data);
        print(topRepo?.message);
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
