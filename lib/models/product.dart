// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final String shopName;
  final String shopDescription;
  final String shopId;
  final String productName;
  final String productDescription;
  final String quantity;  
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  
  Product({
    required this.shopName,
    required this.shopDescription,
    required this.shopId,
    required this.productName,
    required this.productDescription,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shopName': shopName,
      'shopDescription': shopDescription,
      'shopId': shopId,
      'productName': productName,
      'productDescription': productDescription,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      shopName: map['shopName'] ?? '',
      shopDescription: map['shopDescription'] ?? '',
      shopId: map['shopId'] ?? '',
      productName: map['productName'] ?? '',
      productDescription: map['productDescription'] ?? '',
      quantity: map['quantity'] ?? '',
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
