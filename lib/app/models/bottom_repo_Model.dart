class BottomRepoModel {
  final List<RangeOfPattern>? rangeOfPattern;
  final List<DesignOccasion>? designOccasion;
  final String? status;
  final String? message;

  BottomRepoModel({
    this.rangeOfPattern,
    this.designOccasion,
    this.status,
    this.message,
  });

  BottomRepoModel.fromJson(Map<String, dynamic> json)
      : rangeOfPattern = (json['range_of_pattern'] as List?)?.map((dynamic e) => RangeOfPattern.fromJson(e as Map<String, dynamic>)).toList(),
        designOccasion = (json['design_occasion'] as List?)?.map((dynamic e) => DesignOccasion.fromJson(e as Map<String, dynamic>)).toList(),
        status = json['status'] as String?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
        'range_of_pattern': rangeOfPattern?.map((e) => e.toJson()).toList(),
        'design_occasion': designOccasion?.map((e) => e.toJson()).toList(),
        'status': status,
        'message': message
      };
}

class RangeOfPattern {
  final String? productId;
  final String? image;
  final String? name;

  RangeOfPattern({
    this.productId,
    this.image,
    this.name,
  });

  RangeOfPattern.fromJson(Map<String, dynamic> json)
      : productId = json['product_id'] as String?,
        image = json['image'] as String?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'product_id': productId, 'image': image, 'name': name};
}

class DesignOccasion {
  final String? productId;
  final String? name;
  final String? image;
  final String? subName;
  final String? cta;

  DesignOccasion({
    this.productId,
    this.name,
    this.image,
    this.subName,
    this.cta,
  });

  DesignOccasion.fromJson(Map<String, dynamic> json)
      : productId = json['product_id'] as String?,
        name = json['name'] as String?,
        image = json['image'] as String?,
        subName = json['sub_name'] as String?,
        cta = json['cta'] as String?;

  Map<String, dynamic> toJson() => {'product_id': productId, 'name': name, 'image': image, 'sub_name': subName, 'cta': cta};
}
