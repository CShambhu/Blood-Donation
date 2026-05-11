import 'package:blood_donation/blood_campaigns.dart';
import 'package:blood_donation/check_request.dart';
import 'package:blood_donation/login.dart';
import 'package:blood_donation/profile.dart';
import 'package:blood_donation/request_blood.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Text("Blood Donation"),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
              icon: Icon(Icons.person, size: 45),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 720,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(70),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Text(
                      " DO YOU KNOW? ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                Positioned(
                  top: 550,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(80, 40),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckRequest(),
                            ),
                          );
                        },
                        child: Text("Check Blood Requests"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RequestBlood(),
                            ),
                          );
                        },
                        child: Text("Request Blood"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
