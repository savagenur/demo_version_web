import 'package:demo_version_web/utils/constants.dart';
import 'package:flutter/material.dart';

class AddressAndDateWidget extends StatelessWidget {
  final bool isHistoryPage;
  const AddressAndDateWidget({
    Key? key,  this.isHistoryPage=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: [
          Spacer(),
          Text(
            "Дом ул Алтымышева 33",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Spacer(),
        isHistoryPage?Container():  Text(
            "Счет за апрель 2022",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
