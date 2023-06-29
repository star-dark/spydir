import 'package:flutter/material.dart';
import 'package:spydir/constants/sizes.dart';
import 'package:spydir/screens/sign_up/set_password_screen.dart';
import '../../constants/gaps.dart';
import '../../widgets/next_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _email = "";

  @override
  void initState() {
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    super.initState();
  }

  void _onNextTap() {
    if (_email.isEmpty) return;
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SetPasswordScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(25, 21, 20, 1),
      appBar: AppBar(
        title: const Text(
          "계정 생성",
          style: TextStyle(
            fontSize: Sizes.size20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "E-mail",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  cursorHeight: Sizes.size24,
                  cursorColor: const Color.fromRGBO(252, 202, 70, 1),
                ),
              ),
              const Text(
                "이메일을 입력해주세요.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Gaps.v32,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _onNextTap(),
                    child: NextButton(disabled: _email.isEmpty),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
