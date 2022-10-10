import 'package:demo_version_web/utils/constants.dart';
import 'package:demo_version_web/widgets/default_scaffold_widget.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

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
                "Счет за (мусор, воду, пастбища,\nполивная вода) апрель 2022",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: blackFontColor, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(flex: 1),
            Container(
              child: Text(
                "Пожалуйста оцените качество услуг подачи воды",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: blackFontColor,
                    ),
              ),
            ),
            Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildStarButton(context, "1", '☹'),
                SizedBox(
                  width: defaultPadding,
                ),
                buildStarButton(context, "2", '😐'),
                SizedBox(
                  width: defaultPadding,
                ),
                buildStarButton(context, "3", '😄'),
              ],
            ),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/check');
          },
          child: const Text(
            "Пропустить",
            style: TextStyle(fontSize: 21),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  ElevatedButton buildStarButton(
      BuildContext context, String text, String icon) {
    return ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).pushNamed('/create-review');
        },
        icon: Text(
          icon,
          style: TextStyle(fontSize: 30),
        ),
        label: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
        ));
  }
}
