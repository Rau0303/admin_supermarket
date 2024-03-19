import 'package:admin_supermarket/screens/main/homePage.dart';
import 'package:admin_supermarket/screens/main/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  static  List<Widget> _pages = <Widget>[
    HomePage(),
    ProfileScreen(),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_selectedIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1)
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
            child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                selectedIndex: _selectedIndex,
                onTabChange: (index){
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                tabs:const [
               GButton(icon: Icons.home,text: "Home",),
              GButton(icon: Icons.person,text: "Profile",)
            ]),
          )
          ,
        ),
      )
    );

  }
}
