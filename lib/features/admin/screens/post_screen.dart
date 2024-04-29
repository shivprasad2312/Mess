import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mess/common/widgets/loader.dart';
import 'package:mess/features/admin/screens/add_product_screen.dart';
import 'package:mess/features/admin/screens/add_product_screen_admin.dart';
import 'package:mess/features/admin/service/admin_services.dart';
import 'package:mess/features/auth/widgets/single_product.dart';
import 'package:mess/main.dart';
import 'package:mess/models/product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();


  // void showNotification() async {
  //   AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
  //     "notifications-youtube",
  //     "YouTube Notifications",
  //     priority: Priority.max,
  //     importance: Importance.max
  //   );

  //   DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
  //     presentAlert: true,
  //     presentBadge: true,
  //     presentSound: true,
  //   );

  //   NotificationDetails notiDetails = NotificationDetails(
  //     android: androidDetails,
  //     iOS: iosDetails
  //   );

  //   await notificationsPlugin.show(
  //     0, 'Sample Notification ', 'This is notification', notiDetails);

  //   // DateTime scheduleDate = DateTime.now().add(Duration(seconds: 5));

  //   // await notificationsPlugin.zonedSchedule(
  //   //   0,
  //   //   "Sample Notification",
  //   //   "This is a notification",
  //   //   tz.TZDateTime.from(scheduleDate, tz.local),
  //   //   notiDetails,
  //   //   uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
  //   //   androidAllowWhileIdle: true,
  //   //   payload: "notification-payload"
  //   // );
  // }


  // // void checkForNotification() async {
  // //   NotificationAppLaunchDetails? details = await notificationsPlugin.getNotificationAppLaunchDetails();

  // //   if(details != null) {
  // //     if(details.didNotificationLaunchApp) {
  // //       NotificationResponse? response = details.notificationResponse;

  // //       if(response != null) {
  // //         String? payload = response.payload;
  // //         log("Notification Payload: $payload" as num);
  // //       }
  // //     }
  // //   }
  // // }


  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreenAdmin.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productData = products![index];
                return Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProduct(
                          image: productData.images[0],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                productData.shopName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            IconButton(
                              onPressed: () => deleteProduct(productData, index),
                              icon: const Icon(
                                Icons.delete_outline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: navigateToAddProduct,
              tooltip: 'Add a Product',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
