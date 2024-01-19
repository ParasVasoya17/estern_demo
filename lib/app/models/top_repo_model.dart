class TopRepoModel {
  final List<MainStickyMenu>? mainStickyMenu;
  final String? status;
  final String? message;

  TopRepoModel({
    this.mainStickyMenu,
    this.status,
    this.message,
  });

  TopRepoModel.fromJson(Map<String, dynamic> json)
      : mainStickyMenu = (json['main_sticky_menu'] as List?)?.map((dynamic e) => MainStickyMenu.fromJson(e as Map<String, dynamic>)).toList(),
        status = json['status'] as String?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'main_sticky_menu': mainStickyMenu?.map((e) => e.toJson()).toList(), 'status': status, 'message': message};
}

class MainStickyMenu {
  final String? title;
  final String? image;
  final String? sortOrder;
  final List<SliderImages>? sliderImages;

  MainStickyMenu({
    this.title,
    this.image,
    this.sortOrder,
    this.sliderImages,
  });

  MainStickyMenu.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        image = json['image'] as String?,
        sortOrder = json['sort_order'] as String?,
        sliderImages = (json['slider_images'] as List?)?.map((dynamic e) => SliderImages.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'title': title, 'image': image, 'sort_order': sortOrder, 'slider_images': sliderImages?.map((e) => e.toJson()).toList()};
}

class SliderImages {
  final String? title;
  final String? image;
  final String? sortOrder;
  final String? cta;

  SliderImages({
    this.title,
    this.image,
    this.sortOrder,
    this.cta,
  });

  SliderImages.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        image = json['image'] as String?,
        sortOrder = json['sort_order'] as String?,
        cta = json['cta'] as String?;

  Map<String, dynamic> toJson() => {'title': title, 'image': image, 'sort_order': sortOrder, 'cta': cta};
}
