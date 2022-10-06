import 'package:demo_version_web/utils/constants.dart';
import 'package:demo_version_web/widgets/payment_history_button.dart';
import 'package:flutter/material.dart';

import '../widgets/build_app_bar.dart';

class DefaultScaffoldWidget extends StatelessWidget {
  final Widget child;
  final bool hasAddressOnAppBar;
  final bool onlyMenuButton;
  final bool hasHistoryAndMenuButton;
  final Widget? floatingActionButton;
  const DefaultScaffoldWidget({
    Key? key,
    required this.child,
    this.hasAddressOnAppBar = true,
    this.onlyMenuButton = false,
    this.hasHistoryAndMenuButton = false, this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        hasAction: hasAddressOnAppBar,
      ),
      body: child,
      // floatingActionButtonLocation: onlyMenuButton
      //     ? FloatingActionButtonLocation.centerFloat
      //     : FloatingActionButtonLocation.startFloat,
      // floatingActionButton: PaymentHistoryButton(
      //     onlyMenuButton: onlyMenuButton,
      //     hasHistoryAndMenuButton: hasHistoryAndMenuButton),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton,
    );
  }
}
