import 'package:flutter/material.dart';
import 'package:mess/common/widgets/bottom_bar.dart';
import 'package:mess/features/admin/screens/add_product_screen.dart';
import 'package:mess/features/auth/screens/auth_screen.dart';
import 'package:mess/features/auth/screens/signup_screen.dart';
import 'package:mess/features/home/screens/category_deals_screen.dart';
import 'package:mess/features/home/screens/home_screen.dart';


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

      case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );        

      
    // case SearchScreen.routeName:
    //   var searchQuery = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => SearchScreen(
    //       searchQuery: searchQuery,
    //     ),
    //   );

    // case HomeScreenA.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const HomeScreenA(),
    //   );

    //  case HomeScreenB.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const HomeScreenB(),
    //   );

    //  case HomeScreenC.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const HomeScreenC(),
    //   );  

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