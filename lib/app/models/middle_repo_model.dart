class MiddleRepoModel {
  final List<ShopByCategory>? shopByCategory;
  final List<ShopByFabric>? shopByFabric;
  final List<Unstitched>? unstitched;
  final List<BoutiqueCollection>? boutiqueCollection;
  final String? status;
  final String? message;

  MiddleRepoModel({
    this.shopByCategory,
    this.shopByFabric,
    this.unstitched,
    this.boutiqueCollection,
    this.status,
    this.message,
  });

  MiddleRepoModel.fromJson(Map<String, dynamic> json)
      : shopByCategory = (json['shop_by_category'] as List?)?.map((dynamic e) => ShopByCategory.fromJson(e as Map<String, dynamic>)).toList(),
        shopByFabric = (json['shop_by_fabric'] as List?)?.map((dynamic e) => ShopByFabric.fromJson(e as Map<String, dynamic>)).toList(),
        unstitched = (json['Unstitched'] as List?)?.map((dynamic e) => Unstitched.fromJson(e as Map<String, dynamic>)).toList(),
        boutiqueCollection = (json['boutique_collection'] as List?)?.map((dynamic e) => BoutiqueCollection.fromJson(e as Map<String, dynamic>)).toList(),
        status = json['status'] as String?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
        'shop_by_category': shopByCategory?.map((e) => e.toJson()).toList(),
        'shop_by_fabric': shopByFabric?.map((e) => e.toJson()).toList(),
        'Unstitched': unstitched?.map((e) => e.toJson()).toList(),
        'boutique_collection': boutiqueCollection?.map((e) => e.toJson()).toList(),
        'status': status,
        'message': message
      };
}

class ShopByCategory {
  final String? categoryId;
  final String? name;
  final String? tintColor;
  final String? image;
  final String? sortOrder;

  ShopByCategory({
    this.categoryId,
    this.name,
    this.tintColor,
    this.image,
    this.sortOrder,
  });

  ShopByCategory.fromJson(Map<String, dynamic> json)
      : categoryId = json['category_id'] as String?,
        name = json['name'] as String?,
        tintColor = json['tint_color'] as String?,
        image = json['image'] as String?,
        sortOrder = json['sort_order'] as String?;

  Map<String, dynamic> toJson() => {'category_id': categoryId, 'name': name, 'tint_color': tintColor, 'image': image, 'sort_order': sortOrder};
}

class ShopByFabric {
  final String? fabricId;
  final String? name;
  final String? tintColor;
  final String? image;
  final String? sortOrder;

  ShopByFabric({
    this.fabricId,
    this.name,
    this.tintColor,
    this.image,
    this.sortOrder,
  });

  ShopByFabric.fromJson(Map<String, dynamic> json)
      : fabricId = json['fabric_id'] as String?,
        name = json['name'] as String?,
        tintColor = json['tint_color'] as String?,
        image = json['image'] as String?,
        sortOrder = json['sort_order'] as String?;

  Map<String, dynamic> toJson() => {'fabric_id': fabricId, 'name': name, 'tint_color': tintColor, 'image': image, 'sort_order': sortOrder};
}

class Unstitched {
  final String? rangeId;
  final String? name;
  final String? description;
  final String? image;

  Unstitched({
    this.rangeId,
    this.name,
    this.description,
    this.image,
  });

  Unstitched.fromJson(Map<String, dynamic> json)
      : rangeId = json['range_id'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        image = json['image'] as String?;

  Map<String, dynamic> toJson() => {'range_id': rangeId, 'name': name, 'description': description, 'image': image};
}

class BoutiqueCollection {
  final String? bannerImage;
  final String? name;
  final String? cta;
  final String? bannerId;

  BoutiqueCollection({
    this.bannerImage,
    this.name,
    this.cta,
    this.bannerId,
  });

  BoutiqueCollection.fromJson(Map<String, dynamic> json)
      : bannerImage = json['banner_image'] as String?,
        name = json['name'] as String?,
        cta = json['cta'] as String?,
        bannerId = json['banner_id'] as String?;

  Map<String, dynamic> toJson() => {'banner_image': bannerImage, 'name': name, 'cta': cta, 'banner_id': bannerId};
}
