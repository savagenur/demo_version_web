import 'package:flutter/material.dart';

import '../models/bill_model.dart';
class MyDataTable extends StatefulWidget {
  const MyDataTable({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
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
    return Container(
      height: MediaQuery.of(context).size.height * .7,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: columns,
            rows: getRows(bills),
            columnSpacing: 200,
            dataRowHeight: 70,
          ),
        ),
      ),
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
          onPressed: () {},
          child: Text(
            "Калькуляция",
          ),
          style: ElevatedButton.styleFrom(shape: BeveledRectangleBorder()),
        )
      ];
      return DataRow(cells: getCells(cells));
    }).toList();
  }

  List<DataCell> getCells(List<dynamic> cells) {
    return cells.map((data) => DataCell(data)).toList();
  }
}