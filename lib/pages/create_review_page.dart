import 'package:demo_version_web/utils/constants.dart';
import 'package:demo_version_web/widgets/default_scaffold_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';

class CreateReviewPage extends StatelessWidget {
  const CreateReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffoldWidget(
        child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 4),
          Container(
            child: Text(
              "Опишите причину недовольства:",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: blackFontColor, fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(flex: 1),
          Flex(
            direction: Axis.horizontal,
            children: [
              Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 2,
                child: TextField(
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: "Введите текст...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
          Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 10),
              MyButton(
                onTap: () => Navigator.of(context).pushNamed('/check'),
                width: 250,
                icon: Icons.reviews_outlined,
                text: "Отправить отзыв",
              ),
              Spacer(flex: 1),
              MyButton(
                onTap: () => Navigator.of(context).pushNamed('/check'),
                width: 250,
                color: Colors.orange,
                icon: Icons.arrow_forward,
                text: "Пропустить",
              ),
              Spacer(flex: 10),
            ],
          ),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    ));
  }
}
