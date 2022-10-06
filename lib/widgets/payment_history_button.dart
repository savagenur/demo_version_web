import 'package:demo_version_web/utils/constants.dart';
import 'package:demo_version_web/widgets/back_to_menu_button.dart';
import 'package:flutter/material.dart';

class PaymentHistoryButton extends StatelessWidget {
  final bool onlyMenuButton;
  final bool hasHistoryAndMenuButton;
  const PaymentHistoryButton({
    Key? key,
    this.onlyMenuButton = false,
    this.hasHistoryAndMenuButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: hasHistoryAndMenuButton
          ? Row(
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.history),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/payment-history');

                  },
                  label: Text("История оплат"),
                ),
                Spacer(
                  flex: 83,
                ),
                BackToMenuButton(),
                Spacer(
                  flex: 120,
                ),
              ],
            )
          : onlyMenuButton
              ? BackToMenuButton()
              : ElevatedButton.icon(
                  icon: Icon(Icons.history),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/payment-history');
                  },
                  label: Text("История оплат"),
                ),
    );
  }
}
