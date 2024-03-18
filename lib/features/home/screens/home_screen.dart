// import 'package:flutter/material.dart';
// import 'package:mess/common/widgets/bottom_bar.dart';
// import 'package:mess/common/widgets/details.dart';
// import 'package:mess/common/widgets/widget_support.dart';
// import 'package:mess/features/home/screens/home_screen_a.dart';
// import 'package:mess/features/home/screens/home_screen_b.dart';
// import 'package:mess/features/home/screens/home_screen_c.dart';

// class HomeScreen extends StatefulWidget {
//   static const String routeName = '/home';
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeState();
// }

// List<String> foodImages = [
//   "https://example.com/image1.jpg",
//   "https://example.com/image2.jpg",
//   // Add more image URLs as needed
// ];

// class _HomeState extends State<HomeScreen> {
//   bool icecream = false, pizza = false, salad = false, burger = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.only(top: 50.0, left: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Hello Shivam,", style: AppWidget.boldTextFeildStyle()),
//                   Container(
//                     margin: const EdgeInsets.only(right: 20.0),
//                     padding: const EdgeInsets.all(3),
//                     decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(8)),
//                     child: const Icon(
//                       Icons.shopping_cart_outlined,
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Text("Delicious Food", style: AppWidget.HeadlineTextFeildStyle()),
//               Text("Discover and Get Great Food",
//                   style: AppWidget.LightTextFeildStyle()),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Container(margin: const EdgeInsets.only(right: 20.0), child: showItem()),
//               const SizedBox(
//                 height: 30.0,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.all(4),
//                         child: Material(
//                           elevation: 5.0,
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(
//                             padding: const EdgeInsets.all(14),
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Image.asset(
//                                     "images/canva.png",
//                                     height: 150,
//                                     width: 150,
//                                     fit: BoxFit.cover,
//                                   ),
//                                   Text("Veggie Taco Hash",
//                                       style: AppWidget.semiBoldTextFeildStyle()),
//                                   const SizedBox(
//                                     height: 5.0,
//                                   ),
//                                   Text("Fresh and Healthy",
//                                       style: AppWidget.LightTextFeildStyle()),
//                                   const SizedBox(
//                                     height: 5.0,
//                                   ),
//                                   Text(
//                                     "\$25",
//                                     style: AppWidget.semiBoldTextFeildStyle(),
//                                   )
//                                 ]),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 15.0,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(4),
//                       child: Material(
//                         elevation: 5.0,
//                         borderRadius: BorderRadius.circular(20),
//                         child: Container(
//                           padding: const EdgeInsets.all(14),
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Image.asset(
//                                   "images/canva.png",
//                                   height: 150,
//                                   width: 150,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 Text("Mix Veg Salad",
//                                     style: AppWidget.semiBoldTextFeildStyle()),
//                                 const SizedBox(
//                                   height: 5.0,
//                                 ),
//                                 Text("Spicy with Onion",
//                                     style: AppWidget.LightTextFeildStyle()),
//                                 const SizedBox(
//                                   height: 5.0,
//                                 ),
//                                 Text(
//                                   "\$28",
//                                   style: AppWidget.semiBoldTextFeildStyle(),
//                                 )
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30.0,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(right: 20.0),
//                 child: Material(
//                   elevation: 5.0,
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset(
//                           "images/salad.png",
//                           height: 120,
//                           width: 120,
//                           fit: BoxFit.cover,
//                         ),
//                         const SizedBox(width: 20.0,),
//                         Column(children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("Mediterranean Chickpea Salad", style: AppWidget.semiBoldTextFeildStyle(),)),
//                             const SizedBox(height: 5.0,),
//                             Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("Honey goot cheese", style: AppWidget.LightTextFeildStyle(),)),
//                               const SizedBox(height: 5.0,),
//                             Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("\$28", style: AppWidget.semiBoldTextFeildStyle(),))
//                         ],)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//                 const SizedBox(
//                 height: 30.0,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(right: 20.0),
//                 child: Material(
//                   elevation: 5.0,
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset(
//                           "images/salad.png",
//                           height: 120,
//                           width: 120,
//                           fit: BoxFit.cover,
//                         ),
//                         const SizedBox(width: 20.0,),
//                         Column(children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("Veggie Taco Hash", style: AppWidget.semiBoldTextFeildStyle(),)),
//                             const SizedBox(height: 5.0,),
//                             Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("Honey goot cheese", style: AppWidget.LightTextFeildStyle(),)),
//                               const SizedBox(height: 5.0,),
//                             Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("\$28", style: AppWidget.semiBoldTextFeildStyle(),))
//                         ],)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomBar(),
//     );
//   }

//   Widget showItem() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//           onTap: () {
//             icecream = true;
//             pizza = false;
//             salad = false;
//             burger = false;
//             setState(() {});
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => HomeScreenA()),
//             );
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: icecream ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: const EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/ice-cream.png",
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//                 color: icecream ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             icecream = false;
//             pizza = true;
//             salad = false;
//             burger = false;
//             setState(() {});
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => HomeScreenB()),
//             );
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: pizza ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: const EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/pizza.png",
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//                 color: pizza ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             icecream = false;
//             pizza = false;
//             salad = true;
//             burger = false;
//             setState(() {});
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => HomeScreenC()),
//             );
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: salad ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: const EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/salad.png",
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//                 color: salad ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             icecream = false;
//             pizza = false;
//             salad = false;
//             burger = true;
//             setState(() {});
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: burger ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: const EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/burger.png",
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//                 color: burger ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:mess/common/widgets/bottom_bar.dart';
// import 'package:mess/common/widgets/details.dart';
// import 'package:mess/common/widgets/widget_support.dart';
// import 'package:mess/constants/utils.dart';
// import 'package:mess/features/home/screens/home_screen_a.dart';
// import 'package:mess/features/home/screens/home_screen_b.dart';
// import 'package:mess/features/home/screens/home_screen_c.dart';

// class HomeScreen extends StatefulWidget {
//   static const String routeName = '/home';

//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool icecream = false, pizza = false, salad = false, burger = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.only(top: 50.0, left: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Hello Shivam,", style: AppWidget.boldTextFeildStyle()),
//                   Container(
//                     margin: const EdgeInsets.only(right: 20.0),
//                     padding: const EdgeInsets.all(3),
//                     decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(8)),
//                     child: const Icon(
//                       Icons.shopping_cart_outlined,
//                       color: Colors.white,
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Text("Delicious Food", style: AppWidget.HeadlineTextFeildStyle()),
//               Text("Discover and Get Great Food",
//                   style: AppWidget.LightTextFeildStyle()),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Container(margin: const EdgeInsets.only(right: 20.0), child: showItem()),
//               const SizedBox(
//                 height: 30.0,
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => Details()));
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.all(4),
//                         child: Material(
//                           elevation: 5.0,
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(
//                             padding: const EdgeInsets.all(14),
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Image.asset(
//                                     "images/canva.png",
//                                     height: 150,
//                                     width: 150,
//                                     fit: BoxFit.cover,
//                                   ),
//                                   Text("Veggie Taco Hash",
//                                       style: AppWidget.semiBoldTextFeildStyle()),
//                                   const SizedBox(
//                                     height: 5.0,
//                                   ),
//                                   Text("Fresh and Healthy",
//                                       style: AppWidget.LightTextFeildStyle()),
//                                   const SizedBox(
//                                     height: 5.0,
//                                   ),
//                                   Text(
//                                     "\$25",
//                                     style: AppWidget.semiBoldTextFeildStyle(),
//                                   )
//                                 ]),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 15.0,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(4),
//                       child: Material(
//                         elevation: 5.0,
//                         borderRadius: BorderRadius.circular(20),
//                         child: Container(
//                           padding: const EdgeInsets.all(14),
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Image.asset(
//                                   "images/canva.png",
//                                   height: 150,
//                                   width: 150,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 Text("Mix Veg Salad",
//                                     style: AppWidget.semiBoldTextFeildStyle()),
//                                 const SizedBox(
//                                   height: 5.0,
//                                 ),
//                                 Text("Spicy with Onion",
//                                     style: AppWidget.LightTextFeildStyle()),
//                                 const SizedBox(
//                                   height: 5.0,
//                                 ),
//                                 Text(
//                                   "\$28",
//                                   style: AppWidget.semiBoldTextFeildStyle(),
//                                 )
//                               ]),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30.0,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(right: 20.0),
//                 child: Material(
//                   elevation: 5.0,
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset(
//                           "images/salad.png",
//                           height: 120,
//                           width: 120,
//                           fit: BoxFit.cover,
//                         ),
//                         const SizedBox(width: 20.0,),
//                         Column(children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("Mediterranean Chickpea Salad", style: AppWidget.semiBoldTextFeildStyle(),)),
//                             const SizedBox(height: 5.0,),
//                             Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("Honey goat cheese", style: AppWidget.LightTextFeildStyle(),)),
//                               const SizedBox(height: 5.0,),
//                             Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("\$28", style: AppWidget.semiBoldTextFeildStyle(),))
//                         ],)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//                 const SizedBox(
//                 height: 30.0,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(right: 20.0),
//                 child: Material(
//                   elevation: 5.0,
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset(
//                           "images/salad.png",
//                           height: 120,
//                           width: 120,
//                           fit: BoxFit.cover,
//                         ),
//                         const SizedBox(width: 20.0,),
//                         Column(children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("Veggie Taco Hash", style: AppWidget.semiBoldTextFeildStyle(),)),
//                             const SizedBox(height: 5.0,),
//                             Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("Honey goat cheese", style: AppWidget.LightTextFeildStyle(),)),
//                               const SizedBox(height: 5.0,),
//                             Container(
//                             width: MediaQuery.of(context).size.width/2,
//                             child: Text("\$28", style: AppWidget.semiBoldTextFeildStyle(),))
//                         ],)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomBar(),
//     );
//   }

//   Widget showItem() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         GestureDetector(
//           onTap: () {
//             icecream = true;
//             pizza = false;
//             salad = false;
//             burger = false;
//             setState(() {});
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => HomeScreenA()),
//             );
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: icecream ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: const EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/ice-cream.png",
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//                 color: icecream ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             icecream = false;
//             pizza = true;
//             salad = false;
//             burger = false;
//             setState(() {});
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => HomeScreenB()),
//             );
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: pizza ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: const EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/pizza.png",
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//                 color: pizza ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             icecream = false;
//             pizza = false;
//             salad = true;
//             burger = false;
//             setState(() {});
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => HomeScreenC()),
//             );
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: salad ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: const EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/salad.png",
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//                 color: salad ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             icecream = false;
//             pizza = false;
//             salad = false;
//             burger = true;
//             setState(() {});
//           },
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: burger ? Colors.black : Colors.white,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: const EdgeInsets.all(8),
//               child: Image.asset(
//                 "images/burger.png",
//                 height: 40,
//                 width: 40,
//                 fit: BoxFit.cover,
//                 color: burger ? Colors.white : Colors.black,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Your App!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'This is your home screen.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: HomeScreen(),
//   ));
// }
