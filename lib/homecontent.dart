import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
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
                  top: 100,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Text(
                      " DO YOU KNOW? ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Positioned(
                  top: 550,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     minimumSize: Size(80, 40),
                      //   ),
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => CheckRequest(),
                      //       ),
                      //     );
                      //   },
                      //   child: Text("Check Blood Requests"),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => RequestBlood(),
                      //       ),
                      //     );
                      //   },
                      //   child: Text("Request Blood"),
                      // ),
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
