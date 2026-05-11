import 'package:flutter/material.dart';

class RequestBlood extends StatefulWidget {
  const RequestBlood({super.key});

  @override
  State<RequestBlood> createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {
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
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Patient's full name",
                              labelText: "Full Name",

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 5),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "hospital name",
                              labelText: "Patient admitted hospital",

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 5),

                          TextField(
                            decoration: InputDecoration(
                              hintText: " Blood Group",
                              labelText: "Required Blood Group",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 5),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "blood required date",
                              labelText: "Blood Requirement date",

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 5),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "Contact Number",
                              labelText: "Whom to contact",

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 5),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "Upload form",
                              labelText: "Blood Requisition form",

                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 5),

                          TextField(
                            decoration: InputDecoration(
                              hintText: "Any Message",
                              labelText: "Leave a message for donors",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),

                          SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
