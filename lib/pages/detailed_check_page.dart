import 'package:demo_version_web/models/bill_model.dart';
import 'package:demo_version_web/utils/constants.dart';
import 'package:demo_version_web/widgets/back_to_menu_button.dart';
import 'package:demo_version_web/widgets/build_app_bar.dart';
import 'package:demo_version_web/widgets/default_scaffold_widget.dart';
import 'package:demo_version_web/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/address_and_date_widget.dart';
import '../../widgets/my_data_table.dart';

class DetailedCheckPage extends StatefulWidget {
  const DetailedCheckPage({Key? key}) : super(key: key);

  @override
  State<DetailedCheckPage> createState() => _DetailedCheckPageState();
}

class _DetailedCheckPageState extends State<DetailedCheckPage> {
  late List<BillModel> bills;
  @override
  void initState() {
    bills = List.of(allBills);
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
        child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          AddressAndDateWidget(),
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
         
          
        ],
      ),
    ));
  }

  DataTable buildDataTable(List<DataColumn> columns) {
    return DataTable(
      columns: columns,
      rows: getRows(bills),
      columnSpacing: 200,
      dataRowHeight: 70,
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
          child: Text(
            "Расчёт",
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
