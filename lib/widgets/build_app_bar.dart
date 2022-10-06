import 'package:demo_version_web/utils/constants.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool hasAction;
  final bool hasLeading;
  const MyAppBar({
    Key? key,
    this.hasAction = true,
    this.hasLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/review'),
        child: Column(
          children: [
            Text("Объединенная квитанция с. Тосор"),
            Center(
              child: Text(
                "Дом ул. Алтымышева 33",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/review');
              },
              icon: Icon(Icons.home)),
        ],
      ),
      leadingWidth: MediaQuery.of(context).size.width * .25,
      automaticallyImplyLeading: hasLeading,
      centerTitle: true,
      actions: [
        Container(
          width: MediaQuery.of(context).size.width * .25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/payment-history');
                },
                icon: Icon(Icons.history),
                label: Text("История оплат"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color?>(appBarColor),
                    elevation: MaterialStateProperty.all<double?>(0)),
              ),
              hasAction ? Container() : Container(),
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
