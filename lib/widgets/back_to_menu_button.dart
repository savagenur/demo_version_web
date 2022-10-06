import 'package:demo_version_web/widgets/my_button.dart';
import 'package:flutter/material.dart';
class BackToMenuButton extends StatelessWidget {
  const BackToMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => Navigator.of(context).pushNamed('/check'),
      fontSize: 16,
      icon: Icons.home_outlined,
      text: "Выйти на главную",
    );
  }
}