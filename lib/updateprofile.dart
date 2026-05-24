import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  String? selectedBloodGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "Update your profile \nbefore requesting for blood",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
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
                top: 90,
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
                            //Full Name
                            TextFormField(
                              keyboardType: TextInputType.name,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z ]'),
                                ),
                              ],
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

                            //Address
                            TextFormField(
                              keyboardType: TextInputType.name,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z ]'),
                                ),
                              ],
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

                            //Date Of Birth
                            TextFormField(
                              controller: birthDatecontroller,
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                );

                                if (pickedDate != null) {
                                  setState(() {
                                    birthDatecontroller.text =
                                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                  });
                                }
                              },
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

                            //Phone Number
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                hintText: "Enter your Phone Number",
                                labelText: "Phone Number",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter your phone number";
                                }
                                if (value.length != 10) {
                                  return "please enter valid phone number";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),

                            //Blood Group
                            DropdownButtonFormField(
                              initialValue: selectedBloodGroup,
                              decoration: InputDecoration(
                                hintText: "Your Blood Group",
                                labelText: "Blood Group",
                                border: OutlineInputBorder(),
                              ),
                              items: const [
                                DropdownMenuItem(
                                  value: "A+",
                                  child: Text("A+"),
                                ),
                                DropdownMenuItem(
                                  value: "A-",
                                  child: Text("A-"),
                                ),
                                DropdownMenuItem(
                                  value: "B+",
                                  child: Text("B+"),
                                ),
                                DropdownMenuItem(
                                  value: "B-",
                                  child: Text("B-"),
                                ),
                                DropdownMenuItem(
                                  value: "AB+",
                                  child: Text("AB+"),
                                ),
                                DropdownMenuItem(
                                  value: "AB-",
                                  child: Text("AB-"),
                                ),
                                DropdownMenuItem(
                                  value: "O+",
                                  child: Text("O+"),
                                ),
                                DropdownMenuItem(
                                  value: "O-",
                                  child: Text("O-"),
                                ),
                              ],
                              onChanged: (value) => {
                                setState(() {
                                  selectedBloodGroup = value;
                                }),
                              },

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter your blood group";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),

                            //last donation date
                            TextFormField(
                              readOnly: true,
                              controller: lastDonationcontroller,
                              decoration: InputDecoration(
                                hintText:
                                    "When did you donate blood last time?",
                                labelText: "Last Donation",
                                border: OutlineInputBorder(),
                              ),

                              onTap: () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(3000),
                                );

                                if (selectedDate != null) {
                                  setState(() {
                                    lastDonationcontroller.text =
                                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                                  });
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter your last donation date";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),

                            // Blood Donated Times
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
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
