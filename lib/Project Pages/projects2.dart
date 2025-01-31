import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Project%20Pages/project_detail_page.dart.dart';
import 'package:portfolio/main.dart';

class Project2 extends StatelessWidget {
  const Project2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Hidden()));
                  },
                  child: Container(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Projects",
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 59, 59, 61),
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 20),
            child: Container(
              width: 370,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none,
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2.1,
                  ),
                ),
              ),
              child: Text(
                "Select Destination",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.off(
                    ProjectDetailPage(
                        ProjectTitle: "Blinkit",
                        ProjectDescription:
                            "Blinkit is a fast and efficient platform designed for instant grocery and essentials delivery."),
                  );
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        child: Center(
                            child: Text(
                          "B",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    SizedBox(width: 50),
                    Container(
                      child: Text(
                        "Blinkit",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.off(
                    ProjectDetailPage(
                        ProjectTitle: "Blinkit",
                        ProjectDescription:
                            "Blinkit is a fast and efficient platform designed for instant grocery and essentials delivery."),
                  );
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        child: Center(
                            child: Text(
                          "B",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    SizedBox(width: 50),
                    Container(
                      child: Text(
                        "Blinkit",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
