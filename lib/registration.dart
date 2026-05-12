import 'package:blood_donation/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> onSubmit(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("username", usernameController.text);
    await pref.setString("password", passwordController.text);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Registered Successfully")));

    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 720,
          child: Stack(
            // clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(70),
                  ),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset("assets/images/lives.png"),
              ),

              Positioned(
                top: 265,
                left: 25,
                right: 25,
                child: Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode:
                          AutovalidateMode.onUserInteractionIfError,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " \" Become a Donor, Register below. \"",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                            ),
                          ),

                          SizedBox(height: 15),
                          TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: "Enter your username",
                              label: Text("Username"),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter username";
                              } else {
                                return null;
                              }
                            },
                          ),

                          SizedBox(height: 10),

                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              label: Text("Password"),
                              hintText: "Enter your Password",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter password";
                              }
                              if (value.length < 8) {
                                return "password length should be 8 or more";
                              } else {
                                return null;
                              }
                            },
                          ),

                          SizedBox(height: 20),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  onSubmit(context);
                                }
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text("Login", style: TextStyle(fontSize: 18)),
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
