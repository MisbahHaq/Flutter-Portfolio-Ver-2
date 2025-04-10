import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Portfolio/Constants/FontWidgets.dart';
import 'package:Portfolio/Constants/DevNotes.dart';
import 'package:Portfolio/Constants/Navbar.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, dynamic>> workItems = [
    {
      'title': 'Foodgo',
      'subtitle':
          'FoodGo is a mobile app designed to satisfy your cravings instantly. ',
    },
    {
      'title': 'Zelt Website',
      'subtitle': 'A fully responsive clone of the Zelt',
    },
    {
      'title': 'CyberFiction',
      'subtitle':
          'A simple website built with HTML, CSS, and JavaScript that features a 3D-looking image effect that moves when the user scrolls.',
    },
    {
      'title': 'CineFlix',
      'subtitle':
          'CineFlix is a mobile app designed to enhance your movie-going experience.',
    },
  ];
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isDarkMode = false;
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _devNotesKey = GlobalKey();

  late AnimationController _animationController;
  late Animation<Offset> _misbahAnimation;
  late Animation<Offset> _haqueAnimation;

  bool isHovered = false;

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
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Column(
        children: [
          NavBar(
            isDarkMode: isDarkMode,
            toggleTheme: toggleTheme,
            onNavItemTap: (String section) {
              if (section == "Home") {
                scrollToSection(_homeKey);
              } else if (section == "Work") {
                scrollToSection(_workKey);
              } else if (section == "Dev Notes") {
                scrollToSection(_devNotesKey);
              }
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      isDarkMode
                          ? [
                            Color.fromARGB(255, 77, 75, 184),
                            Color.fromARGB(255, 4, 110, 39),
                          ]
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
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 4,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          MediaQuery.of(context).size.width >
                                                  600
                                              ? 2
                                              : 1,
                                      mainAxisExtent: 160,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                    ),
                                itemBuilder: (context, index) {
                                  final item =
                                      widget
                                          .workItems[index]; // Use your list from HomePage
                                  return Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(
                                        isDarkMode ? 0.2 : 0.9,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
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
                                                item['title'] == 'EMERITUS'
                                                    ? Colors.green
                                                    : item['title'] ==
                                                        'RetroAlly'
                                                    ? Colors.deepOrange
                                                    : isDarkMode
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        if (item['title'] != 'airops')
                                          Text.rich(
                                            TextSpan(
                                              text: 'at ',
                                              children: [
                                                TextSpan(
                                                  text: 'WYEWORKS.',
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
