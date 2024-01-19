import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      assignId: true,
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('FABCURATE'),
              centerTitle: false,
              actions: [
                Row(
                  children: [Icon(Icons.search), 10.horizontalSpace, Icon(Icons.shopping_cart), 10.horizontalSpace],
                ),
              ],
            ),
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 100.h,
                  child: controller.topRepo == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: controller.topRepo?.mainStickyMenu?.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                                // padding: EdgeInsets.symmetric(horizontal: 20.w),
                                // height: 100.h,
                                decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(4.r)),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    controller.topRepo?.mainStickyMenu?[index].image != null
                                        ? Image.network(
                                            controller.topRepo!.mainStickyMenu![index].image!,
                                            height: 60.h,
                                            width: 120.w,
                                            fit: BoxFit.cover,
                                          )
                                        : Text("Not Available"),
                                    Text(
                                      controller.topRepo?.mainStickyMenu?[index].title != null ? controller.topRepo!.mainStickyMenu![index].title! : "",
                                      style: TextStyle(color: Colors.black, fontSize: 12.sp),
                                    ),
                                    2.verticalSpace
                                  ],
                                ));
                          },
                        ),
                ),
                Container(
                  height: 200.h,
                  child: controller.imgList.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 1.0,
                            enlargeCenterPage: true,
                          ),
                          items: controller.imgList,
                        ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Text("Shop By Category", style: TextStyle(fontSize: 20.sp)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 300.h,
                  width: Get.width,
                  child: controller.middleRepo == null
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.middleRepo?.shopByCategory?.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  color: Colors.pink[50],
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        controller.middleRepo!.shopByCategory![index].image!,
                                        height: 100.h,
                                        width: 280.w,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          controller.middleRepo!.shopByCategory![index].name!,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          "+Explore",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Text("Shop By Fabric Material", style: TextStyle(fontSize: 20.sp)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 250.h,
                  width: Get.width,
                  child: controller.middleRepo == null
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.middleRepo?.shopByFabric?.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100.h,
                              padding: EdgeInsets.only(bottom: 10.h),
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        controller.middleRepo!.shopByFabric![index].image!,
                                      ),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle),
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  width: 50.w,
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    controller.middleRepo!.shopByFabric![index].name!,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            );
                          },
                        ),
                )
              ],
            ));
      },
    );
  }
}
