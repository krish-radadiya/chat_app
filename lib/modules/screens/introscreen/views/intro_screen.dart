import 'package:flutter/material.dart';

class AppIntro extends StatefulWidget {
  const AppIntro({super.key});

  @override
  AppIntroState createState() => AppIntroState();
}

class AppIntroState extends State<AppIntro> {
  final PageController _pageController = PageController(initialPage: 0);

  final List _pages = [
    {
      'image': 'lib/assets/Conversation-rafiki.png',
      'title': 'Welcome to My App',
      'description':
          'Start with a warm welcome message a brief description of the apps purpose or key features'
    },
    {
      'image': 'lib/assets/Mobile user-cuate.png',
      'title': 'Explore Features',
      'description':
          'Provide clear options for users to either sign up for a new account '
    },
    {
      'image': 'lib/assets/Chatting-rafiki.png',
      'title': 'Get Started',
      'description': 'Let\'s get started!',
    },
  ];

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _pages[index]['image'],
                      height: 250,
                      width: 250,
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      _pages[index]['title'],
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        _pages[index]['description'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // Add circles to indicate the current page
            Positioned(
              bottom: 32.0,
              left: 16.0,
              child: Row(
                children: [
                  for (int i = 0; i < _pages.length; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      height: 12.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == _currentPageIndex
                            ? Theme.of(context).cardColor
                            : Colors.black,
                      ),
                    ),
                ],
              ),
            ),
            // Add a button to move to the next page or get started
            Positioned(
              bottom: 32.0,
              right: 16.0,
              child: _currentPageIndex == _pages.length - 1
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: const Text('Get Started'),
                    )
                  : IconButton(
                      onPressed: () {
                        // Move to the next page when the arrow button is tapped
                        _pageController.nextPage(
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
