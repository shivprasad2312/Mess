import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mess/models/rentProduct.dart';
import 'package:mess/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:mess/constants/error_handling.dart';
import 'package:mess/constants/global_variables.dart';
import 'package:mess/constants/utils.dart';

class RentServices {
 Future<List<RentProduct>> fetchCategoryRentProducts({
  required BuildContext context,
  required String category, // Add shopId parameter
}) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  List<RentProduct> productList = [];
  try {
    http.Response res = await http.get(
      Uri.parse('$uri/api/prod?category=$category'), // Use shopId in URI
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
            RentProduct.fromJson(
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


//  Future<List<RentProduct>> fetchCategoryRentProducts({
//   required BuildContext context,
//   required String category // Add shopId parameter
// }) async {
//   final userProvider = Provider.of<UserProvider>(context, listen: false);
//   List<RentProduct> productList = [];
//   try {
//     http.Response res = await http.get(
//       Uri.parse('$uri/api/product?category=$category'), // Use shopId in URI
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//         'x-auth-token': userProvider.user.token,
//       },
//     );
//     print('Response status code: ${res.statusCode}');
//     print('Response body: ${res.body}');

//     httpErrorHandle(
//       response: res,
//       context: context,
//       onSuccess: () {
//         for (int i = 0; i < jsonDecode(res.body).length; i++) {
//           productList.add(
//             RentProduct.fromJson(
//               jsonEncode(
//                 jsonDecode(res.body)[i],
//               ),
//             ),
//           );
//         }
//         print('Shop products fetched: $productList'); // Add print statement
//       },
//     );
//   } catch (e) {
//     showSnackBar(context, e.toString());
//   }
//   return productList;
// }


}
