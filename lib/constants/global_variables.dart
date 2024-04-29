import 'package:flutter/material.dart';

String uri='http://192.168.1.47:3000';
const String google_api_key ="AIzaSyBbzSbqNS28snAxOWn4EMP5j9HW0jLNMYs";
class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;



static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'BreakFast',
      'image': 'images/breakfast.png',
    },
    {
      'title': 'Snacks',
      'image': 'images/food.png',
    },
    {
      'title': 'Drinks',
      'image': 'images/drinks.png',
    },
    {
      'title': 'Meal',
      'image': 'images/meal.png',
    },
    // {
    //   'title': 'Fashion',
    //   'image': 'images/coffee.png',
    // },
  ];

  static const List<Map<String, String>> rentcategoryImages = [
    {
      'title': 'Hostel',
      'image': 'images/breakfast.png',
    },
    {
      'title': '1 BHK',
      'image': 'images/food.png',
    },
    {
      'title': '2 BHK',
      'image': 'images/drinks.png',
    },
    {
      'title': '1 RK',
      'image': 'images/meal.png',
    },
    // {
    //   'title': 'Fashion',
    //   'image': 'images/coffee.png',
    // },
  ];

}