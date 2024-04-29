import 'dart:convert';

class RentProduct {
  
  final String category;
  final String ownerName;
  final double mobileNo;
  final String houseName;
  final double rent;
  final double deposit;
  final List<String> images;
  final String gender;
  final String furnish;
  final String wifi;
  final String date;
  final String security;
  final String parking;
  final String? id;

  RentProduct({
    required this.category,
    required this.ownerName,
    required this.mobileNo,
    required this.houseName,
    required this.rent,
    required this.deposit,
    required this.images,
    required this.gender,
    required this.furnish,
    required this.wifi,
    required this.date,
    required this.security,
    required this.parking,
     this.id
  });
    


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'ownerName': ownerName,
      'mobileNo': mobileNo,
      'houseName': houseName,
      'rent': rent,
      'deposit': deposit,
      'images': images,
      'gender': gender,
      'furnish': furnish,
      'date':date,
      'wifi': wifi,
      'security': security,
      'parking': parking,
      'id': id,
    };
  }

  factory RentProduct.fromMap(Map<String, dynamic> map) {
    return RentProduct(
      category: map['category'] ?? '',
      ownerName: map['ownerName'] ?? '',
      mobileNo: map['mobileNo']?.toDouble() ?? 0.0,
      houseName: map['houseName'] ?? '',
      rent: map['rent']?.toDouble() ?? 0.0,
      deposit: map['deposit']?.toDouble() ?? 0.0,
      images: List<String>.from((map['images'])),
      gender: map['gender'] ?? '',
      date: map['date'] ?? '',
      furnish: map['furnish'] ?? '',
      wifi: map['wifi'] ?? '',
      security: map['security'] ?? '',
      parking: map['parking'] ?? '',
      id: map['_id'] ,
    );
  }

  String toJson() => json.encode(toMap());

  factory RentProduct.fromJson(String source) => RentProduct.fromMap(json.decode(source) as Map<String, dynamic>);
}
