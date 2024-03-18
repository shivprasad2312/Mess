import 'package:flutter/material.dart';
import 'package:mess/constants/global_variables.dart';
import 'package:mess/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: GlobalVariables.appBarGradient,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Consumer<UserProvider>(
              builder: (context, userProvider, _) {
                return Text(
                  'Hello, ${userProvider.user.name}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            'Your account content goes here',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
