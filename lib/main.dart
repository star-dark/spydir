import 'package:flutter/material.dart';
import 'package:spydir/pages/main_page.dart';
import 'package:spydir/widgets/bottom_navigation_bar.dart';
import 'package:spydir/pages/observe_page.dart';
import 'package:spydir/pages/write_page.dart';
import 'package:spydir/pages/calendar_page.dart';
import 'package:spydir/pages/profile_page.dart';
import 'package:spydir/screens/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  bool isLogin = true; //여기 부분을 바꿔, 다른 접근 가능
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MainPage(),
    const ObservePage(),
    const WritePage(),
    const CalendarPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget initialPage;

    if (isLogin) {
      initialPage = const MainPage();
    }

    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(252, 202, 70, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
      ),
      home: isLogin
          ? Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/init_screen.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: _pages[_currentIndex],
              ),
              floatingActionButton: _currentIndex == 2
                  ? null
                  : FloatingActionButton.large(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      child: const Icon(
                        Icons.add_circle_rounded,
                        color: Color.fromRGBO(252, 202, 70, 1),
                        size: 80,
                      ),
                    ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: isLogin
                  ? MainBottomNavigation(
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    )
                  : null,
            )
          : const LogInScreen(),
    );
  }
}
