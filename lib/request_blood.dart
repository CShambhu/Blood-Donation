import 'package:flutter/material.dart';

class RequestBlood extends StatefulWidget {
  const RequestBlood({super.key});

  @override
  State<RequestBlood> createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {
  final TextEditingController patientNamecontroller = TextEditingController();
  final TextEditingController hospitalNamecontroller = TextEditingController();
  final TextEditingController bloodGroupcontroller = TextEditingController();
  final TextEditingController requiredDatecontroller = TextEditingController();
  final TextEditingController contactPersoncontroller = TextEditingController();
  final TextEditingController bloodFormcontroller = TextEditingController();
  final TextEditingController messagecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Request Blood"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 920,
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
                child: Center(
                  child: Text(
                    "Fill in the Blood Request Form",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Positioned(
                top: 500,
                left: 0,
                right: 0,
                child: Image.asset("assets/images/blood_donation.png"),
              ),

              Positioned(
                top: 120,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
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
                              controller: patientNamecontroller,
                              decoration: InputDecoration(
                                hintText: "Patient's full name",
                                labelText: "Patient's Name",

                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter patient's name";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),

                            TextFormField(
                              controller: hospitalNamecontroller,
                              decoration: InputDecoration(
                                hintText: "hospital name",
                                labelText: "Patient admitted hospital",

                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter patient's admitted hospital name";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: " Blood Group",
                                labelText: "Required Blood Group",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter patient's blood group";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "blood required date",
                                labelText: "Blood Requirement date",

                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter when is blood required";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Contact Number",
                                labelText: "Whom to contact",

                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter contact number";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Upload form",
                                labelText: "Blood Requisition form",

                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please upload blood requisition form";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),

                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Any Message",
                                labelText: "Leave a message for donors",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please leave any message for donor";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),

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
                                          "You have requested for blood.",
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Request ",
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
