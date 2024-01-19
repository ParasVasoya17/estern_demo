class CategoryRepoModel {
  final List<Categories>? categories;
  final String? bannerImage;
  final String? status;
  final String? message;

  CategoryRepoModel({
    this.categories,
    this.bannerImage,
    this.status,
    this.message,
  });

  CategoryRepoModel.fromJson(Map<String, dynamic> json)
      : categories = (json['categories'] as List?)?.map((dynamic e) => Categories.fromJson(e as Map<String, dynamic>)).toList(),
        bannerImage = json['banner_image'] as String?,
        status = json['status'] as String?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() =>
      {'categories': categories?.map((e) => e.toJson()).toList(), 'banner_image': bannerImage, 'status': status, 'message': message};
}

class Categories {
  final String? categoryId;
  final String? categoryName;
  final String? parentId;
  final List<Child>? child;

  Categories({
    this.categoryId,
    this.categoryName,
    this.parentId,
    this.child,
  });

  Categories.fromJson(Map<String, dynamic> json)
      : categoryId = json['category_id'] as String?,
        categoryName = json['category_name'] as String?,
        parentId = json['parent_id'] as String?,
        child = (json['child'] as List?)?.map((dynamic e) => Child.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() =>
      {'category_id': categoryId, 'category_name': categoryName, 'parent_id': parentId, 'child': child?.map((e) => e.toJson()).toList()};
}

class Child {
  final String? categoryId;
  final String? categoryName;
  final String? parentId;

  Child({
    this.categoryId,
    this.categoryName,
    this.parentId,
  });

  Child.fromJson(Map<String, dynamic> json)
      : categoryId = json['category_id'] as String?,
        categoryName = json['category_name'] as String?,
        parentId = json['parent_id'] as String?;

  Map<String, dynamic> toJson() => {'category_id': categoryId, 'category_name': categoryName, 'parent_id': parentId};
}
