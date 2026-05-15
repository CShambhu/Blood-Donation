import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  String selectedDate = "No Date";
  String? selectedBloodGroup;
  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(3000),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

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
                            //patient's name
                            TextFormField(
                              keyboardType: TextInputType.name,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z ]'),
                                ),
                              ],
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
                                if (value.length != 32) {
                                  return "please enter patient's name";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),

                            //hospital name
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

                            // TextFormField(
                            //   controller: bloodGroupcontroller,
                            //   readOnly: true,

                            //   decoration: InputDecoration(
                            //     hintText: " Blood Group",
                            //     labelText: "Required Blood Group",
                            //     border: OutlineInputBorder(),
                            //   ),
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return "please enter patient's blood group";
                            //     }
                            //     return null;
                            //   },
                            // ),
                            // FIXED: replaced TextFormField with DropdownButtonFormField

                            //Blood Group
                            DropdownButtonFormField<String>(
                              initialValue: selectedBloodGroup,

                              decoration: InputDecoration(
                                hintText: "Blood Group",
                                labelText: "Required Blood Group",
                                border: OutlineInputBorder(),
                              ),

                              items: const [
                                DropdownMenuItem(
                                  value: 'A+',
                                  child: Text('A+'),
                                ),
                                DropdownMenuItem(
                                  value: 'A-',
                                  child: Text('A-'),
                                ),
                                DropdownMenuItem(
                                  value: 'B+',
                                  child: Text('B+'),
                                ),
                                DropdownMenuItem(
                                  value: 'B-',
                                  child: Text('B-'),
                                ),
                                DropdownMenuItem(
                                  value: 'O+',
                                  child: Text('O+'),
                                ),
                                DropdownMenuItem(
                                  value: 'O-',
                                  child: Text('O-'),
                                ),
                                DropdownMenuItem(
                                  value: 'AB+',
                                  child: Text('AB+'),
                                ),
                                DropdownMenuItem(
                                  value: 'AB-',
                                  child: Text('AB-'),
                                ),
                              ],

                              onChanged: (value) {
                                setState(() {
                                  selectedBloodGroup = value;
                                });
                              },

                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please select patient's blood group";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),

                            //DateTime
                            TextFormField(
                              controller: requiredDatecontroller,
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(3000),
                                  builder: (context, child) {
                                    return Transform.scale(
                                      scale: 0.75,
                                      child: child,
                                    );
                                  },
                                );
                                if (pickedDate != null) {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder: (context, child) {
                                      return Transform.scale(
                                        scale: 0.85,
                                        child: child,
                                      );
                                    },
                                  );

                                  if (pickedTime != null) {
                                    setState(() {
                                      requiredDatecontroller.text =
                                          "On ${pickedDate.day}/${pickedDate.month}/${pickedDate.year},  "
                                          "By ${pickedTime.format(context)}";
                                    });
                                  }
                                }
                              },

                              decoration: InputDecoration(
                                hintText: "blood required date",
                                labelText: "Blood Requirement date",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter blood required date";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5),

                            // Contact
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                hintText: "Contact Number",
                                labelText: "Whom to contact",

                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter contact number";
                                }
                                if (value.length != 10) {
                                  return 'Invalid number format';
                                }

                                return null;
                              },
                            ),
                            SizedBox(height: 5),

                            //Blood Form
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

                            //message
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
