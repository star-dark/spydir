import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spydir/constants/sizes.dart';
import '../../constants/gaps.dart';
import '../../widgets/next_button.dart';

const List<String> _genderList = <String>[
  '선택',
  '남성',
  '여성',
];

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int _selectedGender = 0;
  final TextEditingController _genderController = TextEditingController();

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: Sizes.size6),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  void _onNextTap() {
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
                "성별",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () => _showDialog(
                  CupertinoPicker(
                      itemExtent: Sizes.size32,
                      scrollController: FixedExtentScrollController(
                        initialItem: _selectedGender,
                      ),
                      onSelectedItemChanged: (int selectItem) {
                        setState(() {
                          _selectedGender = selectItem;
                          _genderController.value = TextEditingValue(
                              text: _genderList[_selectedGender]);
                        });
                      },
                      children: List<Widget>.generate(_genderList.length,
                          (int index) {
                        return Center(child: Text(_genderList[index]));
                      })),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: _genderController,
                    enabled: false,
                    decoration: const InputDecoration(
                      icon: FaIcon(
                        FontAwesomeIcons.check,
                      ),
                      hintText: "성별",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    cursorColor: Colors.red,
                  ),
                ),
              ),
              Gaps.v32,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _onNextTap(),
                    child: NextButton(
                      disabled: (_genderList[_selectedGender] == "선택"),
                    ),
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
