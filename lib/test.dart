import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  final List<Map<String, dynamic>> workItems = [
    {
      'title': 'Foodgo',
      'subtitle':
          'FoodGo is a mobile app designed to satisfy your cravings instantly.',
      'tech': 'Flutter & Firebase',
      'image': 'assets/icons/icon.png', // Replace with actual image paths
      'alertText': 'FoodGo is your go-to app for fast food delivery, enjoy!',
    },
    {
      'title': 'Zelt Website',
      'subtitle': 'A fully responsive clone of the Zelt',
      'tech': 'HTML, CSS, JavaScript',
      'image': 'assets/icons/icon.png', // Replace with actual image paths
      'alertText': 'A clone of Zelt website, fully responsive and dynamic!',
    },
    {
      'title': 'CyberFiction',
      'subtitle':
          'A simple website built with HTML, CSS, and JavaScript that features a 3D-looking image effect that moves when the user scrolls.',
      'tech': 'HTML, CSS, JavaScript',
      'image': 'assets/icons/icon.png', // Replace with actual image paths
      'alertText': 'Experience CyberFiction with an amazing 3D scroll effect!',
    },
    {
      'title': 'CineFlix',
      'subtitle':
          'CineFlix is a mobile app designed to enhance your movie-going experience.',
      'tech': 'Flutter & Firebase',
      'image': 'assets/icons/icon.png', // Replace with actual image paths
      'alertText': 'CineFlix, your movie companion, book tickets easily!',
    },
    {
      'title': 'Mega Mart',
      'subtitle': 'A grocery ordering app with Firebase and Flutter.',
      'tech': 'Flutter & Firebase',
      'image': 'assets/icons/icon.png', // Replace with actual image paths
      'alertText': 'Mega Mart delivers groceries to your doorstep fast!',
    },
    {
      'title': 'Briefly',
      'subtitle':
          'Briefly is a mobile application that delivers the latest news.',
      'tech': 'Flutter & Firebase',
      'image': 'assets/icons/icon.png', // Replace with actual image paths
      'alertText': 'Stay updated with Briefly, the latest news in real-time.',
    },
    {
      'title': 'Blinkit',
      'subtitle':
          'Blinkit is a mobile app designed to bring grocery shopping to your doorstep in no time.',
      'tech': 'Flutter & Firebase',
      'image': 'assets/icons/icon.png', // Replace with actual image paths
      'alertText': 'Blinkit makes grocery shopping quicker and easier!',
    },
  ];

  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool isDarkMode = false;
  int hoveredIndex = -1; // Track the hovered card index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WORK',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color:
                  isDarkMode ? Colors.white70 : Colors.black.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.workItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      mainAxisExtent: 160,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final item = widget.workItems[index];
                      return MouseRegion(
                        onEnter: (_) => setState(() => hoveredIndex = index),
                        onExit: (_) => setState(() => hoveredIndex = -1),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                              isDarkMode ? 0.2 : 0.9,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              if (hoveredIndex == index)
                                BoxShadow(
                                  color: Colors.blueAccent.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text.rich(
                                TextSpan(
                                  text: 'using ',
                                  children: [
                                    TextSpan(
                                      text: item['tech'] ?? 'Unknown',
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                style: TextStyle(
                                  color:
                                      isDarkMode
                                          ? Colors.white70
                                          : Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['subtitle']!,
                                style: TextStyle(
                                  fontSize: 11,
                                  color:
                                      isDarkMode
                                          ? Colors.white70
                                          : Colors.black87,
                                ),
                              ),
                              if (hoveredIndex ==
                                  index) // Show only on hovered card
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        'ALERT:',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        item['alertText']!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
