import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spydir/widgets/login_button.dart';
import '../constants/gaps.dart';
import '../constants/sizes.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('images/init_screen.jpg')),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const FaIcon(
                  FontAwesomeIcons.star,
                  color: Colors.blueGrey,
                  size: Sizes.size32,
                ),
                Gaps.v20,
                const Text(
                  "SPY DIARY",
                  style: TextStyle(
                    fontSize: Sizes.size56,
                    color: Colors.blueGrey,
                  ),
                ),
                Gaps.v28,
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size14,
                      horizontal: Sizes.size20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(252, 202, 70, 1),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: Sizes.size1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "무료로 회원가입하기",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Gaps.v14,
                const AuthButton(
                  text: "구글계정으로 계속하기",
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.amber,
                    size: Sizes.size28,
                  ),
                ),
                Gaps.v14,
                const AuthButton(
                  text: "페이스북계정으로 계속하기",
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blueAccent,
                    size: Sizes.size28,
                  ),
                ),
                Gaps.v14,
                const AuthButton(
                  text: "애플계정으로 계속하기",
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                    size: Sizes.size28,
                  ),
                ),
                Gaps.v24,
                const Text(
                  "Log in",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
