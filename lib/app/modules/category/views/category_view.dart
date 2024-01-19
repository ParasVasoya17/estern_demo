import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      assignId: true,
      builder: (logic) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Category'),
              centerTitle: true,
              actions: [
                Row(
                  children: [Icon(Icons.search), 10.horizontalSpace, Icon(Icons.shopping_cart), 10.horizontalSpace],
                ),
              ],
            ),
            body: controller.category == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.category?.categories?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              height: 150.h,
                              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(controller.category!.bannerImage!), fit: BoxFit.fitWidth)),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.category!.categories![index].categoryName!,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.white,
                                  )
                                ],
                              )),
                        ],
                      );
                    },
                  ));
      },
    );
  }
}
