import 'package:blood_donation/home.dart';
import 'package:blood_donation/registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> onLogin(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();

    String? savedUsername = pref.getString("username");
    String? savedPassword = pref.getString("password");

    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    if (enteredUsername == savedUsername && enteredPassword == savedPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
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
                top: 80,
                left: 0,
                right: 0,
                child: Image.asset("assets/images/blood.png"),
              ),

              const Positioned(
                top: 150,
                left: 23,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    Text(
                      "Sign in to your account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 310,
                left: 25,
                right: 25,
                child: Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: "Enter your username",
                            label: Text("Username"),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(height: 10),

                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            label: Text("Password"),
                            hintText: "Enter your Password",
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              onLogin(context);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 590,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text("Or Login with"),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton.outlined(
                          onPressed: () {},
                          icon: Icon(Icons.facebook),
                        ),

                        SizedBox(width: 10),

                        IconButton.outlined(
                          onPressed: () {},
                          icon: Icon(Icons.email),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Become a Donor? "),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Registration(),
                              ),
                            );
                          },
                          child: Text("Register"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
