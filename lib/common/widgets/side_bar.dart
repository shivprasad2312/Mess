import 'package:flutter/material.dart';
import 'package:mess/features/account/screens/account_services.dart';
import 'package:share_plus/share_plus.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text("Shivam Rao"),
              accountEmail: const Text("shivam@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset("images/canva.png"),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(
                  image: AssetImage("images/canva.png"), fit: BoxFit.cover)
              ),
            ),
            ListTile(
              leading: const Icon(Icons.file_upload),
              title: const Text('Upload Shot'),
              onTap: ()=> print("Upload tapped"),
            ),

            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: ()=> print("Profile tapped"),
            ),

            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: ()=> Share.share("mess"),
            ),

            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: ()=> print("Notifications tapped"),
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Info'),
              onTap: ()=> print("Info tapped"),
            ),

            ListTile(
              leading: const Icon(Icons.note),
              title: const Text('Terms Conditions'),
              onTap: ()=> print("Logout tapped"),
            ),
            const Divider(),
            const Divider(),
       

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: ()=> print("Settings tapped"),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: ()=> AccountServices().logOut(context),
            ),

            
        ],
      ),
    );
  }
}
