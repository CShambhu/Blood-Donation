import 'package:flutter/material.dart';

class CheckRequest extends StatefulWidget {
  const CheckRequest({super.key});

  @override
  State<CheckRequest> createState() => _CheckRequestState();
}

class _CheckRequestState extends State<CheckRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Blood Requests"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 800,
            child: Stack(
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(70),
                    ),
                  ),
                ),
                Positioned(
                  top: 190,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SizedBox(
                      height: 450,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Patient's Name:"),
                                SizedBox(height: 10),
                                Text("Hospital Name:"),
                                SizedBox(height: 10),
                                Text("Required Blood:"),
                                Divider(),
                                Text("Patient's Name:"),
                                SizedBox(height: 10),
                                Text("Hospital Name:"),
                                SizedBox(height: 10),
                                Text("Required Blood:"),
                                Divider(),
                                Text("Patient's Name:"),
                                SizedBox(height: 10),
                                Text("Hospital Name:"),
                                SizedBox(height: 10),
                                Text("Required Blood:"),
                                Divider(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
