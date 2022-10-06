import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final double? width;
  final double? fontSize;
  final VoidCallback onTap;
  final Color? color;
  const MyButton({
    Key? key,
    required this.icon,
    required this.text,
    this.width,
    required this.onTap,
    this.fontSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton.icon(
          onPressed: onTap,
          icon: Icon(icon),
          label: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white, fontSize: fontSize),
          ),
          style: TextButton.styleFrom( backgroundColor: color),),
    );
  }
}
