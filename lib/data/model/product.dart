class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required String? price,
    required this.image,
  }) {
    this.price = double.parse(price ?? "0.00");
  }

  final int? id;
  final String? name;
  final String? description;
  late final double? price;
  final String? image;

  // Factory constructor to create a User from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
    );
  }

  // Method to convert a User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
    };
  }

}