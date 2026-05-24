import 'package:blood_donation/check_request.dart';
import 'package:blood_donation/homecontent.dart';
import 'package:blood_donation/profile.dart';
import 'package:blood_donation/request_blood.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<String> _title = [
    "Blood Donation",
    "Check Request",
    "Request Blood",
    "Profile",
  ];
  final List<Widget> _screen = [
    HomeContent(),
    CheckRequest(),
    RequestBlood(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Row(children: [Text(_title[_selectedIndex]), Spacer()]),
      ),

      body: _screen[_selectedIndex],

      bottomNavigationBar: GNav(
        selectedIndex: _selectedIndex,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        // tabBackgroundColor: Colors.grey,
        backgroundColor: const Color.fromARGB(255, 46, 61, 68),
        activeColor: Colors.blueGrey,
        color: Colors.white,
        style: GnavStyle.oldSchool,
        textSize: 13,

        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        tabs: [
          GButton(icon: Icons.home, text: "Home"),
          GButton(icon: Icons.list_alt, text: "Check Request"),
          GButton(icon: Icons.bloodtype, text: "Request Blood"),
          GButton(icon: Icons.person_2, text: "Profile"),
        ],
      ),
    );
  }
}
