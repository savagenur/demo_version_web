class BillModel {
  final String title;
  final int bill;
  BillModel({
    required this.title,
    required this.bill,
  });
}

final List<BillModel> allBills = [
  BillModel(title: "счет за воду", bill: 3000),
  BillModel(title: "счет за мусор", bill: 2000),
  BillModel(title: "счет за пастбища", bill: 1500),
  BillModel(title: "налог на имущество", bill: 3000),
  BillModel(title: "счет за поливную воду", bill: 2200),
];
