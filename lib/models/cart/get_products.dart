import 'dart:convert';

class GetCart {
  List<Product> products;

  GetCart({
    required this.products,
  });

  factory GetCart.fromJson(Map<String, dynamic> json) => GetCart(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  ProductItem cartItem;
  int quantity;
  String id;

  Product({
    required this.cartItem,
    required this.quantity,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        cartItem: ProductItem.fromJson(json["cartItem"]),
        quantity: json["quantity"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "cartItem": cartItem.toJson(),
        "quantity": quantity,
        "_id": id,
      };
}

class ProductItem {
  final String id;
  final String name;
  final List<String> imageUrl;
  final String price;
  final String category;

  ProductItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json['_id'],
      name: json['name'],
      imageUrl: List<String>.from(json['imageUrl']),
      price: json["price"],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'imageUrl': List<dynamic>.from(imageUrl.map((x) => x)),
      'price': price,
      'category': category,
    };
  }
}
