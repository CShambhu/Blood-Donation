import 'package:blood_donation/login.dart';
import 'package:blood_donation/updateprofile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "";

  @override
  void initState() {
    super.initState();
    loadUsername(); //
  }

  Future<void> loadUsername() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString("username") ?? "User";
    });
  }

  void logOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout? "),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.remove("username");
                await pref.remove("password");

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Logged Out Successfully")),
                );
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 720,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.topCenter,
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
                  top: 95,

                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                  ),
                ),
                Positioned(
                  top: 110,

                  child: Image.asset("assets/images/superman.png", height: 150),
                ),
                Positioned(
                  top: 265,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Text(username, style: TextStyle(fontSize: 25)),
                  ),
                ),

                Positioned(
                  top: 300,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Text("Email:"),
                                SizedBox(height: 15),
                                Text("Address:"),
                                SizedBox(height: 15),
                                Text("Date of Birth:"),
                                SizedBox(height: 15),
                                Text("Phone Number:"),
                                SizedBox(height: 15),
                                Text("Blood Group:"),
                                SizedBox(height: 15),
                                Text("Last Donation:"),
                                SizedBox(height: 15),
                                Text("Blood Donated Times:"),
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 600,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(80, 40),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateProfile(),
                            ),
                          );
                        },
                        child: Text(
                          "Update Profile",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(80, 40),
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          logOut(context);
                        },
                        child: Text(
                          "LogOut",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
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
