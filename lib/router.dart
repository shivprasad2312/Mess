import 'package:flutter/material.dart';
import 'package:mess/common/widgets/bottom_bar.dart';
import 'package:mess/features/admin/screens/add_product_screen.dart';
import 'package:mess/features/auth/screens/auth_screen.dart';
import 'package:mess/features/auth/screens/signup_screen.dart';
import 'package:mess/features/home/screens/home_screen.dart';
import 'package:mess/features/home/screens/home_screen_a.dart';
import 'package:mess/features/home/screens/home_screen_b.dart';
import 'package:mess/features/home/screens/home_screen_c.dart';

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