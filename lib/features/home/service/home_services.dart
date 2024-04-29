import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mess/models/product.dart';
import 'package:mess/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:mess/constants/error_handling.dart';
import 'package:mess/constants/global_variables.dart';
import 'package:mess/constants/utils.dart';

class HomeServices {
  Future<List<Product>> fetchCategoryProducts({
  required BuildContext context,
  required String category,
}) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  List<Product> productList = [];
  try {
    print('Fetching products for category: $category');
    http.Response res = await http.get(
      Uri.parse('$uri/api/products?category=$category'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      },
    );
    print('Response status code: ${res.statusCode}');
    print('Response body: ${res.body}');

    httpErrorHandle(
      response: res,
      context: context,
      onSuccess: () {
        print('Processing response...');
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          print('Adding product $i to productList');
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
    print('Error occurred: $e');
    showSnackBar(context, e.toString());
  }
  print('Returning productList: $productList');
  return productList;
}


 Future<List<Product>> fetchShopProducts({
  required BuildContext context,
  required String shopId, // Add shopId parameter
}) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  List<Product> productList = [];
  try {
    http.Response res = await http.get(
      Uri.parse('$uri/api/product?shopId=$shopId'), // Use shopId in URI
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      },
    );
    print('Response status code: ${res.statusCode}');
    print('Response body: ${res.body}');

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
        print('Shop products fetched: $productList'); // Add print statement
      },
    );
  } catch (e) {
    showSnackBar(context, e.toString());
  }
  return productList;
}


}
