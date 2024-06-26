import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mess/common/widgets/bottom_bar.dart';
import 'package:mess/constants/global_variables.dart';
import 'package:mess/features/admin/screens/admin_accammodation_screen.dart';
import 'package:mess/features/admin/screens/admin_screen.dart';
import 'package:mess/features/admin/screens/post_screen.dart';
import 'package:mess/features/auth/screens/auth_screen.dart';
import 'package:mess/features/auth/services/auth_service.dart';
import 'package:mess/providers/user_provider.dart';
import 'package:mess/router.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin notificationsPlugin =FlutterLocalNotificationsPlugin();

void main() async {

   WidgetsFlutterBinding.ensureInitialized();

  // initializeTimeZones();

  AndroidInitializationSettings androidSettings = AndroidInitializationSettings("@mipmap/ic_launcher");

  DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestCriticalPermission: true,
    requestSoundPermission: true
  );

  InitializationSettings initializationSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings
  );

  bool? initialized = await notificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (response) {
      // log(response.payload.toString());
    }
  );

  // log("Notifications: $initialized");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Amazon Clone',
  theme: ThemeData(
    scaffoldBackgroundColor: GlobalVariables.backgroundColor,
    colorScheme: const ColorScheme.light(
      primary: GlobalVariables.secondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    fontFamily: 'Poppins', // Add the font family here
  ),
  onGenerateRoute: (settings) => generateRoute(settings),
  home: 
  // MapPage(),
  // Provider.of<UserProvider>(context).user.token.isNotEmpty
  //     ? Provider.of<UserProvider>(context).user.type == 'user'
  //         ? const BottomBar()
  //         : const AdminScreen()
          
  //     : const AuthScreen(),


  Consumer<UserProvider>(
  builder: (context, userProvider, _) {
    if (userProvider.user.token.isNotEmpty) {
      return userProvider.user.type == 'user'
          ? const BottomBar()
          : userProvider.user.type == 'food'
              ? const AdminScreen()
              : userProvider.user.type == 'rent'
                  ? const AdminAccommodationScreen()
                  : const AuthScreen();
    } else {
      return const AuthScreen();
    }
  },
),

);

  }
}