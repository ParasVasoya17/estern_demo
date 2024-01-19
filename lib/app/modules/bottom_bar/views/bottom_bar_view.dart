import 'package:eastern_demo/app/modules/category/views/category_view.dart';
import 'package:eastern_demo/app/modules/curate/views/curate_view.dart';
import 'package:eastern_demo/app/modules/home/views/home_view.dart';
import 'package:eastern_demo/app/modules/more/views/more_view.dart';
import 'package:eastern_demo/app/modules/sale/views/sale_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  const BottomBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      init: BottomBarController(),
      assignId: true,
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Container(
            height: 62.h + MediaQuery.of(context).padding.bottom,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 0;
                    controller.update();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 2.h,
                          width: 70.w,
                        ),
                        SizedBox(height: 10.h),
                        Icon(
                          Icons.home,
                          size: 24.w,
                          color: controller.currentIndex.value == 0 ? Colors.green : Colors.black,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: controller.currentIndex.value == 0 ? Colors.green : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 1;
                    controller.update();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 2.h,
                          width: 70.w,
                        ),
                        SizedBox(height: 10.h),
                        Icon(
                          Icons.category,
                          size: 24.w,
                          color: controller.currentIndex.value == 1 ? Colors.green : Colors.black,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Category",
                          style: TextStyle(
                            color: controller.currentIndex.value == 1 ? Colors.green : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 2;
                    controller.update();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 2.h,
                          width: 70.w,
                        ),
                        SizedBox(height: 10.h),
                        Icon(
                          Icons.search,
                          size: 24.w,
                          color: controller.currentIndex.value == 2 ? Colors.green : Colors.black,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Curate",
                          style: TextStyle(
                            color: controller.currentIndex.value == 2 ? Colors.green : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 3;
                    controller.update();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 2.h,
                          width: 70.w,
                        ),
                        SizedBox(height: 10.h),
                        Icon(
                          Icons.light_mode_sharp,
                          size: 24.w,
                          color: controller.currentIndex.value == 3 ? Colors.green : Colors.black,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Sale",
                          style: TextStyle(
                            color: controller.currentIndex.value == 3 ? Colors.green : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 4;
                    controller.update();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 2.h,
                          width: 70.w,
                        ),
                        SizedBox(height: 10.h),
                        Icon(
                          Icons.more_horiz_sharp,
                          size: 24.w,
                          color: controller.currentIndex.value == 4 ? Colors.green : Colors.black,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "More",
                          style: TextStyle(
                            color: controller.currentIndex.value == 4 ? Colors.green : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: controller.currentIndex.value == 0
              ? const HomeView()
              : controller.currentIndex.value == 1
                  ? const CategoryView()
                  : controller.currentIndex.value == 2
                      ? const CurateView()
                      : controller.currentIndex.value == 3
                          ? const SaleView()
                          : MoreView(),
        );
      },
    );
  }
}
