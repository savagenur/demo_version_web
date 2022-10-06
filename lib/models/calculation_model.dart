class CalculationModel {
  final String title;
  final double amount;
  CalculationModel({
    required this.title,
    required this.amount,
  });
}

final List<CalculationModel> allCalculations = [
  CalculationModel(title: "показания счетчика", amount: 3300),
  CalculationModel(title: "предыдущие показания", amount: 2200),
  CalculationModel(title: "разница за апрель", amount: 1100),
  CalculationModel(title: "расчет стоимости за 1ед", amount: 3),
  CalculationModel(title: "пеня", amount: 0.2),
];
