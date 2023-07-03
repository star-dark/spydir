import 'package:flutter/material.dart';
import 'package:spydir/constants/sizes.dart';
import 'package:spydir/screens/sign_up/name_screen.dart';
import '../../constants/gaps.dart';
import '../../widgets/next_button.dart';

class SetPassWordScreen extends StatefulWidget {
  const SetPassWordScreen({super.key});

  @override
  State<SetPassWordScreen> createState() => _SetPassWordScreenState();
}

class _SetPassWordScreenState extends State<SetPassWordScreen> {
  final TextEditingController _passWordController = TextEditingController();
  String _password = "";

  @override
  void initState() {
    _passWordController.addListener(() {
      setState(() {
        _password = _passWordController.text;
      });
    });
    super.initState();
  }

  void _onNextTap() {
    if (_password.length < 8) return;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SetNameScreen()));
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
                "비밀번호 설정",
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
                  controller: _passWordController,
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
                "영어 + 숫자 8자리 이상",
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
                    child: NextButton(disabled: (_password.length < 8)),
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
