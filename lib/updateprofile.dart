import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
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
                top: 110,
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
                top: 170,
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
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter your full name",
                              labelText: "Full Name",

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter your Current Address",
                              labelText: "Curent Address",

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "Your Date of birth",
                              labelText: "Date of Birth",

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter your Phone Number",
                              labelText: "Phone Number",

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "Your Blood Group",
                              labelText: "Blood Group",

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "When did you donate blood last time?",
                              labelText: "Last Donation",

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "How many times have you donated blood",
                              labelText: "Blood Donated Times",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),

                          SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
