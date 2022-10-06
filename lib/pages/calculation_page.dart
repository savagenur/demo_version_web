import 'package:demo_version_web/models/bill_model.dart';
import 'package:demo_version_web/models/calculation_model.dart';
import 'package:demo_version_web/utils/constants.dart';
import 'package:demo_version_web/widgets/back_to_menu_button.dart';
import 'package:demo_version_web/widgets/build_app_bar.dart';
import 'package:demo_version_web/widgets/build_receipt_table.dart';
import 'package:demo_version_web/widgets/default_scaffold_widget.dart';
import 'package:demo_version_web/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../widgets/address_and_date_widget.dart';
import '../widgets/my_data_table.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({Key? key}) : super(key: key);

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  late List<CalculationModel> calculations;
  @override
  void initState() {
    calculations = List.of(allCalculations);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffoldWidget(
      hasHistoryAndMenuButton: true,
      hasAddressOnAppBar: false,
        child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AddressAndDateWidget(),
          Container(
            padding: EdgeInsets.all(defaultPadding),
                height: MediaQuery.of(context).size.height * .675,

            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.grey[200],
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Калькуляция расчета за воду",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  buildCalculationTable(context),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  ListTile(
                    leading: Text(
                      '1000 * 3 = ',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      '3000 сом',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                ],
              ),
            ),
          ),
        
        ],
      ),
    ),floatingActionButton: Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: MyButton(icon: Icons.arrow_back, text: "Вернуться к квитанции", onTap: ()=>Navigator.of(context).pushNamed("/check")),
    ),);
  }

  Widget buildCalculationTable(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: calculations
          .map((model) => ListTile(
                leading: Text(
                  model.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                title: Text(
                  model.amount.toString(),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ))
          .toList(),
    );
  }
}
