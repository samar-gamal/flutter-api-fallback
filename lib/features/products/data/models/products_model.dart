class ProductModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final int? count;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.count});

  factory ProductModel.formJson(Map<String, dynamic> data) => ProductModel(
    id: data['id'],
    title: data['title'],
    price: data['price'].toDouble(),
    description: data['description'],
    category: data['category'],
    image: data['image'],
    count: data['count'],
      );

  static List<ProductModel> formListOfJson(List data) {
    return List.from(data.map((e) => ProductModel.formJson(e)).toList());
  }
}
