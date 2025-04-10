import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Portfolio/Constants/FontWidgets.dart';
import 'package:Portfolio/Constants/DevNotes.dart';
import 'package:Portfolio/Constants/Navbar.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, String>> detailedWorkItems = [
    {
      'company': 'Briefly',
      'duration': 'January 2025 - February 2025',
      'description':
          'Briefly is a mobile application that delivers the latest news based on your selected categories. With real-time updates, an intuitive interface, and a seamless reading experience, you can stay informed on the topics that matter most to you.',
      'tech': 'Flutter & Firebase',
    },
    {
      'company': 'Blinkit',
      'duration': 'December 2025 - January 2025',
      'description':
          'Blinkit Clone is a mobile app designed to bring grocery shopping to your doorstep in no time. It allows users to shop for groceries, fresh produce, daily essentials, and more with instant delivery, offering convenience at your fingertips.',
      'tech': 'Flutter & Firebase',
    },
  ];

  final List<Map<String, dynamic>> workItems = [
    {
      'title': 'Foodgo',
      'subtitle':
          'FoodGo is a mobile app designed to satisfy your cravings instantly.',
      'tech': 'Flutter & Firebase',
    },
    {
      'title': 'Zelt Website',
      'subtitle': 'A fully responsive clone of the Zelt',
      'tech': 'HTML, CSS, JavaScript',
    },
    {
      'title': 'CyberFiction',
      'subtitle':
          'A simple website built with HTML, CSS, and JavaScript that features a 3D-looking image effect that moves when the user scrolls.',
      'tech': 'HTML, CSS, JavaScript',
    },
    {
      'title': 'CineFlix',
      'subtitle':
          'CineFlix is a mobile app designed to enhance your movie-going experience.',
      'tech': 'Flutter & Firebase',
    },
    {
      'title': 'Mega Mart',
      'subtitle': 'A grocery ordering app with Firebase and Flutter.',
      'tech': 'Flutter & Firebase',
    },
  ];

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isDarkMode = false;
  bool showAllWork = false;
  bool isHovered = false;

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _devNotesKey = GlobalKey();

  late AnimationController _animationController;
  late Animation<Offset> _misbahAnimation;
  late Animation<Offset> _haqueAnimation;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _misbahAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _haqueAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final remaining = widget.workItems.length - 3;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: [
          NavBar(
            isDarkMode: isDarkMode,
            toggleTheme: toggleTheme,
            onNavItemTap: (String section) {
              if (section == "Home")
                scrollToSection(_homeKey);
              else if (section == "Work")
                scrollToSection(_workKey);
              else if (section == "Dev Notes")
                scrollToSection(_devNotesKey);
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      isDarkMode
                          ? [Color(0xFF4D4BB8), Color(0xFF046E27)]
                          : [Color(0xFFB5EAD7), Color(0xFFD6C3FC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Home Section
                    Container(
                      key: _homeKey,
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SlideTransition(
                                position: _misbahAnimation,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Text(
                                    "Misbah",
                                    style: AppWidget.HugeStyle(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SlideTransition(
                                position: _haqueAnimation,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 25),
                                  child: Text(
                                    "Haque",
                                    style: AppWidget.HugeStyle(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Work Section
                    Container(
                      key: _workKey,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WORK',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color:
                                  isDarkMode
                                      ? Colors.white70
                                      : Colors.black.withOpacity(0.7),
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
                                    itemCount:
                                        widget.workItems.length > 4
                                            ? 4
                                            : widget.workItems.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              MediaQuery.of(
                                                        context,
                                                      ).size.width >
                                                      600
                                                  ? 2
                                                  : 1,
                                          mainAxisExtent: 160,
                                          mainAxisSpacing: 16,
                                          crossAxisSpacing: 16,
                                        ),
                                    itemBuilder: (context, index) {
                                      final item = widget.workItems[index];
                                      return Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(
                                            isDarkMode ? 0.2 : 0.9,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item['title']!,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text.rich(
                                              TextSpan(
                                                text: 'using ',
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        item['tech'] ??
                                                        'Unknown',
                                                    style: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                fontSize: 12,
                                                color:
                                                    isDarkMode
                                                        ? Colors.white70
                                                        : Colors.black87,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  if (remaining > 0) const SizedBox(height: 16),
                                  if (!showAllWork && remaining > 0)
                                    MouseRegion(
                                      onEnter:
                                          (_) =>
                                              setState(() => isHovered = true),
                                      onExit:
                                          (_) =>
                                              setState(() => isHovered = false),
                                      child: GestureDetector(
                                        onTap:
                                            () => setState(
                                              () => showAllWork = true,
                                            ),
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                isHovered
                                                    ? Color.fromARGB(
                                                      255,
                                                      192,
                                                      250,
                                                      211,
                                                    )
                                                    : Color.fromARGB(
                                                      255,
                                                      212,
                                                      255,
                                                      226,
                                                    ),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            boxShadow:
                                                isHovered
                                                    ? [
                                                      BoxShadow(
                                                        color: Colors
                                                            .greenAccent
                                                            .withOpacity(0.5),
                                                        blurRadius: 15,
                                                        spreadRadius: 2,
                                                      ),
                                                    ]
                                                    : [],
                                          ),
                                          child: Text(
                                            '+$remaining',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green.shade800,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  if (showAllWork)
                                    ...widget.detailedWorkItems.map((item) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color:
                                              isDarkMode
                                                  ? Colors.white12
                                                  : Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 8,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item['company']!,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              item['tech']!,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    isDarkMode
                                                        ? Colors.white
                                                        : Colors.redAccent,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              item['description']!,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color:
                                                    isDarkMode
                                                        ? Colors.white70
                                                        : Colors.black87,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Dev Notes Section
                    Container(
                      key: _devNotesKey,
                      height: MediaQuery.of(context).size.height,
                      child: DevNotesPage(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
