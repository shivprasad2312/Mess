import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mess/common/widgets/side_bar.dart';
import 'package:mess/common/widgets/widget_support.dart';
import 'package:mess/features/home/widgets/address_box.dart';
import 'package:mess/features/home/widgets/carousel_image.dart';
import 'package:mess/features/home/widgets/top_categories.dart';
import 'package:mess/features/search/screens/search_screen.dart';
import 'package:mess/main.dart'; // Import your details screen if not already imported
import 'package:timezone/timezone.dart' as tz;

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void showNotification() async {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      "notifications-youtube",
      "YouTube Notifications",
      priority: Priority.max,
      importance: Importance.max,
      visibility: NotificationVisibility.public,
    );

    DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notiDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await notificationsPlugin.show(0, "Never Tried Mauli's ,Masala Dosa? 🫠",
        'Life is too short not to be!😜', notiDetails);

    DateTime scheduleDate = DateTime.now().add(Duration(seconds: 5));

    await notificationsPlugin.zonedSchedule(
        0,
        "Sample Notification",
        "This is a notification",
        tz.TZDateTime.from(scheduleDate, tz.local),
        notiDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        androidAllowWhileIdle: true,
        payload: "notification-payload");
  }

  void checkForNotification() async {
    NotificationAppLaunchDetails? details =
        await notificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null) {
      if (details.didNotificationLaunchApp) {
        NotificationResponse? response = details.notificationResponse;

        if (response != null) {
          String? payload = response.payload;
          // log("Notification Payload: $payload" as num);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkForNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text("Sairam"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 370,
              decoration: BoxDecoration(
                //             image: DecorationImage(
                //   image: AssetImage("images/canva.png"),
                //   fit: BoxFit.cover,
                // ),
                color:
                    Colors.grey.withOpacity(0.4), // Set background color here
                borderRadius:
                    BorderRadius.circular(20), // Adjust border radius as needed
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AddressBox(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello, Shivam",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // Open Drawer
                              Scaffold.of(context).openDrawer();
                            },
                            child: Icon(
                              Icons.menu,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              onFieldSubmitted: navigateToSearchScreen,
                              decoration: const InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 23,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.transparent,
                                contentPadding: EdgeInsets.only(top: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7),
                                  ),
                                  // borderSide: BorderSide.none,
                                  borderSide: BorderSide(
                                    // Adjust this line to specify border color and width
                                    color: Colors
                                        .black38, // Change the color to make the border visible
                                    width: 1, // Adjust the width as needed
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.black38,
                                    width: 1,
                                  ),
                                ),
                                hintText: 'Search For dishes',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const CarouselImage(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "What's On Your Mind?",
                    style: TextStyle(
                      fontSize: 16, // Adjust font size as needed
                      fontWeight:
                          FontWeight.bold, // Adjust font weight as needed
                    ),
                  ),
                  SizedBox(width: 10), // Add spacing between text and divider
                  Opacity(
                    opacity: 0.9, // Adjust opacity as needed
                    child: Container(
                      height: 2,
                      width: 150, // Adjust width of the divider
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black.withOpacity(
                                0.8), // Adjust color and opacity as needed
                            Colors.black.withOpacity(
                                0.5), // Adjust color and opacity as needed
                            Colors.black.withOpacity(
                                0.3), // Adjust color and opacity as needed
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.09),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.02),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const SizedBox(height: 10),
            const TopCategories(),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            const RentTopCategories(),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Popular Locations!",
                    style: TextStyle(
                      fontSize: 16, // Adjust font size as needed
                      fontWeight:
                          FontWeight.bold, // Adjust font weight as needed
                    ),
                  ),
                  SizedBox(width: 10), // Add spacing between text and divider
                  Opacity(
                    opacity: 0.9, // Adjust opacity as needed
                    child: Container(
                      height: 2,
                      width: 150, // Adjust width of the divider
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black.withOpacity(
                                0.8), // Adjust color and opacity as needed
                            Colors.black.withOpacity(
                                0.5), // Adjust color and opacity as needed
                            Colors.black.withOpacity(
                                0.3), // Adjust color and opacity as needed
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.09),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.02),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/canva.png",
                                height: 230,
                                width: 290,
                                fit: BoxFit.cover,
                              ),
                              Text("Veggie Taco Hash",
                                  style: AppWidget.semiBoldTextFeildStyle()),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text("Fresh and Healthy",
                                  style: AppWidget.LightTextFeildStyle()),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "\25",
                                style: AppWidget.semiBoldTextFeildStyle(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/canva.png",
                                height: 230,
                                width: 290,
                                fit: BoxFit.cover,
                              ),
                              Text("Another Item",
                                  style: AppWidget.semiBoldTextFeildStyle()),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text("Description",
                                  style: AppWidget.LightTextFeildStyle()),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "\30",
                                style: AppWidget.semiBoldTextFeildStyle(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Add more containers similarly
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showNotification,
        child: Icon(Icons.notification_add),
      ),
    );
  }
}
