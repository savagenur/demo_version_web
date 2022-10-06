import 'package:demo_version_web/models/bill_model.dart';
import 'package:demo_version_web/models/monthly_bill_model.dart';
import 'package:demo_version_web/utils/constants.dart';
import 'package:demo_version_web/widgets/build_app_bar.dart';
import 'package:demo_version_web/widgets/default_scaffold_widget.dart';
import 'package:demo_version_web/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/address_and_date_widget.dart';
import '../../widgets/my_data_table.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({Key? key}) : super(key: key);

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  late List<MonthlyBillModel> monthlyBills;
  @override
  void initState() {
    monthlyBills = List.of(allMonthlyBills);
    super.initState();
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
        onlyMenuButton: true,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              AddressAndDateWidget(isHistoryPage: true,),
              Text("История оплат",style: Theme.of(context).textTheme.headline4!.copyWith(color: blackFontColor),),
              Container(
                height: MediaQuery.of(context).size.height * .7,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: buildDataTable(columns),
                  ),
                ),
              ),
              SizedBox(
                height: defaultPadding,
              ),
            
            ],
          ),
        ));
  }

  DataTable buildDataTable(List<DataColumn> columns) {
    return DataTable(
      columns: columns,
      rows: getRows(monthlyBills),
      columnSpacing: 200,
      dataRowHeight: 70,
    );
  }

  List<DataRow> getRows(List<MonthlyBillModel> bills) {
    return bills.map((bill) {
      final cells = [
        Text(
          bill.date,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(bill.bill.toString(),
            style: Theme.of(context).textTheme.headline6),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/detailed-check');
          },
          child: Text(
            "Детальный счёт",
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
