import 'package:flutter/material.dart';
import 'package:mess/constants/global_variables.dart';
import 'package:mess/features/account/screens/account_screen.dart';
import 'package:mess/features/admin/screens/Accammodation_Post_Screen.dart';
import 'package:mess/features/admin/screens/post_screen.dart';
import 'package:mess/features/home/screens/home_screen.dart';

class AdminAccommodationScreen extends StatefulWidget {
  const AdminAccommodationScreen({super.key});

  @override
  State<AdminAccommodationScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminAccommodationScreen> {

int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    AccamodationPostScreen(),
    const Center(
      child: Text("Accamodation"),
    ),

    const Center(child: Text("Admin cart"),),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Allin",style: TextStyle(color: Colors.black),
                )
              ),
              Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  "Accamodation",style: TextStyle(color: Colors.black),
                )
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [  
          // HOME
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),
          // ACCOUNT
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.analytics_outlined,
              ),
            ),
            label: '',
          ),
          // CART
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: 
                Icon(
                  Icons.all_inbox_outlined,
                ),
              // ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}