// import 'package:flutter/material.dart';
// import 'package:mess/constants/global_variables.dart';
// import 'package:mess/features/admin/screens/admin_screen.dart';
// import 'package:mess/features/auth/screens/auth_screen.dart';
// import 'package:mess/features/auth/services/auth_service.dart';
// import 'package:mess/providers/user_provider.dart';
// import 'package:mess/router.dart';
// import 'package:provider/provider.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MultiProvider( 
//     providers: [
//       ChangeNotifierProvider(create: (context)=> UserProvider(),),
//     ],
//     child: const MyApp()));
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   final AuthService authService=AuthService();
//   // This widget is the root of your application.
//   @override

//   void initstate(){
//     super.initState();
//     authService.getUserData(context);
//   }
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Mess',
//       theme: ThemeData(
//         // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         // useMaterial3: true,
//         scaffoldBackgroundColor: GlobalVariables.backgroundColor,
//         colorScheme: const ColorScheme.light(
//           primary: GlobalVariables.secondaryColor,
//         ),
//         appBarTheme: const AppBarTheme(
//           elevation: 0,
//           iconTheme: IconThemeData(
//             color: Colors.black,
//           )
//         )
//       ),

//       onGenerateRoute: (settings)=>generateRoute(settings),
//       home: Provider.of<UserProvider>(context).user.token.isNotEmpty
//           ? Provider.of<UserProvider>(context) == 'user'
//               ? const BottomAppBar()
//               : const AdminScreen()
//           : const AuthScreen(),
          
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:mess/common/widgets/bottom_bar.dart';
import 'package:mess/constants/global_variables.dart';
import 'package:mess/features/admin/screens/admin_screen.dart';
import 'package:mess/features/auth/screens/auth_screen.dart';
import 'package:mess/features/auth/services/auth_service.dart';
import 'package:mess/providers/user_provider.dart';
import 'package:mess/router.dart';
import 'package:provider/provider.dart';

void main() {
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
        useMaterial3: true, // can remove this line
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}