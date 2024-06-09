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

  AddToCart({
    required this.cartItem,
    required this.quantity,
  });

  factory AddToCart.fromJson(Map<String, dynamic> json) {
    return AddToCart(
      cartItem: json['cartItem'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cartItem': cartItem,
      'quantity': quantity,
    };
  }
}
