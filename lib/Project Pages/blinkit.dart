import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Blinkit extends StatefulWidget {
  Blinkit({
    super.key,
  });

  @override
  State<Blinkit> createState() => _BlinkitState();
}

class _BlinkitState extends State<Blinkit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Text(
                        "Blinkit",
                        style: GoogleFonts.poppins(
                            fontSize: 86,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Blinkit is a fast and efficient platform designed for instant grocery and essentials delivery.",
                    style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 400,
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            "Hello",
                            style: TextStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 400,
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            "Hello",
                            style: TextStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 400,
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            "Hello",
                            style: TextStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
