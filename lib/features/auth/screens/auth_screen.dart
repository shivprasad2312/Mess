// import 'package:flutter/material.dart';
// import 'package:mess/constants/global_variables.dart';

// class AuthScreen extends StatefulWidget {

//   static const String routeName='/auth-screen';
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: GlobalVariables.greyBackgroundCOlor,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.only(left: 8,right: 8,top: 20,bottom: 8),
//           child: Column(
//             children: [
//               Text("Welcome...",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
//             ],
//           ),
//         ),),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:mess/constants/global_variables.dart';
import 'package:mess/features/auth/screens/signup_screen.dart';
import 'package:mess/features/auth/services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signInUser() {
  authService.signInUser(
    context: context,
    email: _emailController.text, // Update this line
    password: _passwordController.text, // Update this line
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _signInFormKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
                    child: Text(
                      "Welcome...",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
  controller: _emailController, // Add this line
  decoration: const InputDecoration(labelText: 'Email ID'),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Email ID';
    }
    return null;
  },
),

                  const SizedBox(height: 12),
                  TextFormField(
  controller: _passwordController, // Add this line
  decoration: const InputDecoration(labelText: 'Password'),
  obscureText: true,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    if (value.length < 6) {
      return 'Password should be at least 6 characters';
    }
    return null;
  },
),

                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Checkbox(
                          //   value: _rememberMe ?? false,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       _rememberMe = value ?? false;
                          //     });
                          //   },
                          // ),
                          const Text('Remember me'),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle forgot password
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                        if (_signInFormKey.currentState!.validate()) {
                          signInUser();
                        // }
                      }
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 12),
                  const Text('Or login with', textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Implement Apple login
                        },
                        icon: const Icon(Icons.apple),
                      ),
                      IconButton(
                        onPressed: () {
                          // Implement Facebook login
                        },
                        icon: const Icon(Icons.facebook),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: const Text(
                      "Don't have an account? Sign up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
