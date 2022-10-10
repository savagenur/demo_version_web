import 'package:demo_version_web/models/bill_model.dart';
import 'package:demo_version_web/pages/Payment/payment_method_page.dart';
import 'package:demo_version_web/utils/constants.dart';
import 'package:demo_version_web/widgets/build_app_bar.dart';
import 'package:demo_version_web/widgets/default_scaffold_widget.dart';
import 'package:demo_version_web/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/address_and_date_widget.dart';
import '../../widgets/my_data_table.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  late List<BillModel> bills;
  TextEditingController controller = TextEditingController(text: "14000");
  late String sum;
  @override
  void initState() {
    bills = List.of(allBills);
    super.initState();
    sum = controller.text;
    controller.addListener(() {
      setState(() {
        sum = controller.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final columns = [
      DataColumn(label: Container()),
      DataColumn(label: Container()),
      DataColumn(label: Container()),
    ];
    return DefaultScaffoldWidget(
      hasAddressOnAppBar: false,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddressAndDateWidget(),
              Container(
                height: MediaQuery.of(context).size.height * .55,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: buildDataTable(columns),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Введите сумму оплаты:",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 200,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  hintText: controller.text,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    gapPadding: 10,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    gapPadding: 10,
                  ),
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    gapPadding: 10,
                    borderSide: BorderSide(color: Colors.green),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: MyButton(
                icon: Icons.payments_rounded,
                text: "Выбрать способ оплаты (итого ${sum})",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodPage(
                        text: controller.text == '' ? "14000" : controller.text,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  DataTable buildDataTable(List<DataColumn> columns) {
    return DataTable(
      columns: columns,
      rows: getRows(bills),
      columnSpacing: 200,
      dataRowHeight: 60,
    );
  }

  List<DataRow> getRows(List<BillModel> bills) {
    return bills.map((bill) {
      final cells = [
        Text(
          bill.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(bill.bill.toString(),
            style: Theme.of(context).textTheme.headline6),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/calculation');
          },
          child: const Text(
            "Расчёт ",
          ),
          style: ElevatedButton.styleFrom(shape: BeveledRectangleBorder()),
        )
      ];
      return DataRow(cells: getCells(cells));
    }).toList();
  }

  List<DataCell> getCells(List<dynamic> cells) {
    return cells
        .map(
          (data) => DataCell(data),
        )
        .toList();
  }
}
