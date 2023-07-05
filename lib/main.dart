import 'package:flutter/material.dart';
import 'package:spydir/pages/main_page.dart';
import 'package:spydir/widgets/bottom_navigation_bar.dart';
import 'package:spydir/pages/observe_page.dart';
import 'package:spydir/pages/write_page.dart';
import 'package:spydir/pages/calendar_page.dart';
import 'package:spydir/pages/profile_page.dart';
import 'package:spydir/screens/login_screen.dart';
import 'package:spydir/widgets/floating_button.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  bool isLogin = true; //로그인 상태 변경
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
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

    void set2() {
      setState(() {
        _currentIndex = 2;
      });
    }

    if (isLogin) {
      initialPage = const MainPage(); //로그인 상태라면 메인페이지로 이동
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
              //로그인 상태라면 기능 정상작동 아니라면 로그인페이지로 이동
              body: Container(
//
//기능 1. 기본 배경화면
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/init_screen.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: _pages[_currentIndex],
              ),

//
//기능 2. FloatingActionButton
              floatingActionButton: //현재 글쓰기 페이지면 버튼 비활성화, 버튼을 누르면 글쓰기 페이지로 이동
                  _currentIndex == 2
                      ? null
                      : FloatingButton(onTap: set2), //floating_button.dart
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,

//
//기능 3. bottomNavigationBar
              bottomNavigationBar: isLogin //로그인 상태면 활성화, 로그인 상태가 아니면 비활성화
                  ? BottomNavigation(
                      //bottom_navigation_bar.dart
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    )
                  : null,
            )
          : const LogInScreen(), //login_screen.dart
    );
  }
}
