import 'dart:convert';

AddToCart addToCartFromJson(String str) {
  final jsonData = json.decode(str);
  return AddToCart.fromJson(jsonData);
}

String addToCartToJson(AddToCart data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

class AddToCart {
  final String cartItem;
  final int quantity;
  final String size;

  AddToCart({
    required this.cartItem,
    required this.quantity,
    required this.size,
  });

  factory AddToCart.fromJson(Map<String, dynamic> json) {
    return AddToCart(
      cartItem: json['cartItem'],
      quantity: json['quantity'],
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cartItem': cartItem,
      'quantity': quantity,
      'size': size,
    };
  }
}
