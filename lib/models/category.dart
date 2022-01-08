class Category {
  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.visible,
    required this.productsCount,
  });
  late final int id;
  late final String title;
  late final String description;
  late final String image;
  late final int visible;
  late final int productsCount;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    visible = json['visible'];
    productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['image'] = image;
    _data['visible'] = visible;
    _data['products_count'] = productsCount;
    return _data;
  }
}
