import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
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
            centerTitle: true,
            actions: [
              Row(
                children: [
                  const Icon(Icons.search),
                  10.horizontalSpace,
                  const Icon(Icons.shopping_cart),
                  10.horizontalSpace,
                ],
              ),
            ],
          ),
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 100.h,
                child: controller.topRepo == null
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: controller.topRepo?.mainStickyMenu?.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
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
                                      : const Text("Not Available"),
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
                    ? const Center(child: CircularProgressIndicator())
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
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.middleRepo?.shopByCategory?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 280.w,
                            height: 130.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  controller.middleRepo!.shopByCategory![index].image!,
                                ),
                                alignment: Alignment.bottomCenter,
                                fit: BoxFit.cover,
                              ),
                              color: Colors.pink[50],
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 40.h,
                              width: double.infinity,
                              color: Colors.white.withOpacity(0.8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Text(
                                      controller.middleRepo!.shopByCategory![index].name!,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w, bottom: 2.h, right: 10.w),
                                    child: const Text(
                                      "+Explore",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          //   Column(
                          //   children: [
                          //     Container(
                          //       color: Colors.pink[50],
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Image.network(
                          //             controller.middleRepo!.shopByCategory![index].image!,
                          //             height: 100.h,
                          //             width: 280.w,
                          //             fit: BoxFit.cover,
                          //           ),
                          //           Padding(
                          //             padding: EdgeInsets.only(left: 10.w),
                          //             child: Text(
                          //               controller.middleRepo!.shopByCategory![index].name!,
                          //             ),
                          //           ),
                          //           Padding(
                          //             padding: EdgeInsets.only(left: 10.w),
                          //             child: const Text(
                          //               "+Explore",
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // );
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
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.middleRepo?.shopByFabric?.length,
                        itemBuilder: (context, index) {
                          return Container(
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
                                  style: const TextStyle(color: Colors.white, shadows: [
                                    Shadow(color: Colors.black, blurRadius: 20, offset: Offset(0, 000)),
                                  ]),
                                  textAlign: TextAlign.center,
                                )),
                          );
                        },
                      ),
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Text("UnStitched", style: TextStyle(fontSize: 20.sp)),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 300.h,
                  child: controller.middleRepo?.unstitched == null && controller.imageController == null
                      ? const Center(child: CircularProgressIndicator())
                      : buildGallery3D(controller)),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Text(
                  "Boutique Collection",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              Container(
                // height: 500.h,
                child: controller.boutiqueSlider.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 1.0,
                          viewportFraction: 1,
                          enlargeCenterPage: false,
                          onPageChanged: (index, reason) {
                            controller.current = index;
                            controller.update();
                          },
                        ),
                        items: controller.boutiqueSlider,
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.boutiqueSlider.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => controller.sliderController.animateToPage(entry.key),
                    child: Container(
                      width: 6.0,
                      height: 6.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black)
                              .withOpacity(controller.current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Text("Range Of Pattern", style: TextStyle(fontSize: 20.sp)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 250.h,
                width: Get.width,
                child: controller.bottomRepo == null
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.bottomRepo?.rangeOfPattern?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 10.h),
                            decoration: BoxDecoration(
                                color: Colors.grey[50],
                                image: DecorationImage(
                                    image: NetworkImage(
                                      controller.bottomRepo!.rangeOfPattern![index].image!,
                                    ),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle),
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                width: 60.w,
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  controller.bottomRepo!.rangeOfPattern![index].name!,
                                  softWrap: true,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black87,
                                        blurRadius: 100.0,
                                        spreadRadius: 30.0,
                                        offset: Offset(
                                          0.0,
                                          0.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          );
                        },
                      ),
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Text("Design As Per Occasion", style: TextStyle(fontSize: 20.sp)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 300.h,
                width: Get.width,
                child: controller.middleRepo == null
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.bottomRepo?.designOccasion?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 280.w,
                            height: 130.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  controller.bottomRepo!.designOccasion![index].image!,
                                ),
                                alignment: Alignment.bottomCenter,
                                fit: BoxFit.cover,
                              ),
                              color: Colors.pink[50],
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 40.h,
                              width: double.infinity,
                              color: Colors.white.withOpacity(0.8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Text(
                                      controller.bottomRepo!.designOccasion![index].name!,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w, bottom: 2.h, right: 10.w),
                                    child: const Text(
                                      "+Explore",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildGallery3D(HomeController controller) {
    return Gallery3D(
      controller: controller.imageController!,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      itemConfig: GalleryItemConfig(
        width: 200.w,
        height: 300.h,
        radius: 0,
      ),
      width: Get.width,
      height: 300.h,
      isClip: true,
      onItemChanged: (index) {},
      onClickItem: (index) {},
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
              controller.middleRepo!.unstitched![index].image!,
            ),
            fit: BoxFit.fill,
          )),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Text(controller.middleRepo!.unstitched![index].description!.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 15.sp), textAlign: TextAlign.center),
          ),
        );
      },
    );
  }
}
