import 'package:flutter/material.dart';
import 'package:spydir/constants/sizes.dart';
import 'package:spydir/screens/sign_up/gender_screen.dart';
import '../../constants/gaps.dart';
import '../../widgets/next_button.dart';

class SetNameScreen extends StatefulWidget {
  const SetNameScreen({super.key});

  @override
  State<SetNameScreen> createState() => _SetNameScreenState();
}

class _SetNameScreenState extends State<SetNameScreen> {
  final TextEditingController _nameController = TextEditingController();
  String _name = "";

  @override
  void initState() {
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    super.initState();
  }

  void _onNextTap() {
    if (_name.length < 2) return;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const GenderScreen()));
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
                "닉네임",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _nameController,
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
              Gaps.v32,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _onNextTap(),
                    child: NextButton(disabled: (_name.length < 2)),
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
