class Product {
  final int id;
  final String title;
  final double price;
  final String thumbnail;
  final int stock;
  final double discountPercentage;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.stock,
    required this.discountPercentage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      thumbnail: json['thumbnail'],
      stock: json['stock'],
      discountPercentage: json['discountPercentage'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'thumbnail': thumbnail,
      'stock': stock,
      'discountPercentage': discountPercentage,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.title == title &&
        other.price == price &&
        other.thumbnail == thumbnail &&
        other.stock == stock &&
        other.discountPercentage == discountPercentage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    title.hashCode ^
    price.hashCode ^
    thumbnail.hashCode ^
    stock.hashCode ^
    discountPercentage.hashCode;
  }
}
