import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNamecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController birthDatecontroller = TextEditingController();
  final TextEditingController phoneNumbercontroller = TextEditingController();
  final TextEditingController lastDonationcontroller = TextEditingController();
  final TextEditingController timesDonationcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile Update"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 820,
          width: double.infinity,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Update your profile before requesting for blood",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Positioned(
                top: 140,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        autovalidateMode:
                            AutovalidateMode.onUserInteractionIfError,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter your full name",
                                labelText: "Full Name",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter fullname";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter your Current Address",
                                labelText: "Curent Address",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter your current address";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Your Date of birth",
                                labelText: "Date of Birth",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter your date of birth";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter your Phone Number",
                                labelText: "Phone Number",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter your phone number";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Your Blood Group",
                                labelText: "Blood Group",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter your blood group";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText:
                                    "When did you donate blood last time?",
                                labelText: "Last Donation",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter your last donation date";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText:
                                    "How many times have you donated blood",
                                labelText: "Blood Donated Times",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter how many times you donated";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),

                            SizedBox(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Your profile has been updated.",
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Update ",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
