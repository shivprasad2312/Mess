import 'package:flutter/material.dart';
import 'package:mess/common/widgets/bottom_bar.dart';
import 'package:mess/features/admin/screens/add_product_screen.dart';
import 'package:mess/features/admin/screens/add_product_screen_admin.dart';
import 'package:mess/features/admin/screens/rent_add_products_screen.dart';
import 'package:mess/features/auth/screens/auth_screen.dart';
import 'package:mess/features/auth/screens/signup_screen.dart';
import 'package:mess/features/home/screens/category_deals_screen.dart';
import 'package:mess/features/home/screens/home_screen.dart';
import 'package:mess/features/home/screens/rent_screen.dart';
import 'package:mess/features/product_details/screens/mess_details_screen.dart';
import 'package:mess/features/product_details/screens/product_details_screen.dart';
import 'package:mess/features/search/screens/search_screen.dart';
import 'package:mess/models/product.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch(routeSettings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  HomeScreen(),
      );

    case RentScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  RentScreen(),
      );  

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    case AddProductScreenAdmin.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreenAdmin(),
      );

    case RentAddProductScreenAdmin.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RentAddProductScreenAdmin(),
      );  

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
      
    case RentCategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => RentCategoryDealsScreen(
          category: category,
        ),
      );          
      
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );

      case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          shopId: product.shopId,
          product: product,
        ),
      );

      case MessDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MessDetailScreen(
          product: product,
        ),
      );

    default: 
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Screen Dosen't Exist !!!"),
          ),
        ),
      );  
  }
}