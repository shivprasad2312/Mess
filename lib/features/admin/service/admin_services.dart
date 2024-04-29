import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mess/constants/error_handling.dart';
import 'package:mess/constants/global_variables.dart';
import 'package:mess/constants/utils.dart';
import 'package:mess/models/product.dart';
import 'package:mess/models/rentProduct.dart';
import 'package:mess/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String shopName,
    required String shopDescription,
    required String shopId,
    required String productName,
    required String productDescription,
    required double price,
    required String quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic('dybzzlqhv', 'se7irpmg');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: shopName),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product=Product(
        shopName: shopName, 
        shopDescription: shopDescription, 
        shopId: shopId, 
        productName: productName, 
        productDescription: productDescription, 
        quantity: quantity, 
        images: imageUrls, 
        category: category, 
        price: price
        );
        
      // Product product = Product(
      //   shopName: shopName,
      //   shopDescription:shopDescription,
      //   shopId:shopId,
      //   productName:productName,
      //   productDescription: productDescription,
      //   quantity: quantity,
      //   images: imageUrls,
      //   category: category,
      //   price: price,
      // );

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get all the products
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  ///
  ////
  ///
  ///
  //
  void rentSellProduct({
    required BuildContext context,
    required String category,
    required String ownerName,
    required double mobileNo,
    required String houseName,
    required double rent,
    required double deposit,
    required String gender,
    required String furnish,
    required String wifi,
    required String security,
    required String parking,
    required String date,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic('dybzzlqhv', 'se7irpmg');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: ownerName),
        );
        imageUrls.add(res.secureUrl);
      }

      RentProduct rentProduct = RentProduct(
        category: category, 
        ownerName: ownerName, 
        mobileNo: mobileNo, 
        houseName: houseName, 
        rent: rent, 
        deposit: deposit, 
        images: imageUrls, 
        gender: gender, 
        furnish: furnish, 
        wifi: wifi, 
        date: date, 
        security: security, 
        parking: parking, 
  
        );
        

      http.Response res = await http.post(
        Uri.parse('$uri/rentAdmin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: rentProduct.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  // get all the products
  Future<List<RentProduct>> fetchAllRentProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<RentProduct> rentProductList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/rentAdmin/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            rentProductList.add(
              RentProduct.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return rentProductList;
  }

  void deleteRentProduct({
    required BuildContext context,
    required RentProduct rentProduct,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/rentAdmin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': rentProduct.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

}