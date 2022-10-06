import 'package:demo_version_web/responsive.dart';
import 'package:demo_version_web/utils/constants.dart';
import 'package:demo_version_web/widgets/default_scaffold_widget.dart';
import 'package:demo_version_web/widgets/payment_history_button.dart';
import 'package:flutter/material.dart';

import '../widgets/build_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                style:Responsive.isDesktop(context)? Theme.of(context).textTheme.headline4?.copyWith(
                    color: blackFontColor, fontWeight: FontWeight.bold):Theme.of(context).textTheme.headline5?.copyWith(
                    color: blackFontColor, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(flex: 1),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/review");
                },
                child: Text(
                  "Чтобы посмотреть\nсчет ответьте на\nопрос",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                      ),
                )),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
