class TitleAndInfoModel {
  final String title;
  final String info;
  TitleAndInfoModel({
    required this.title,
    required this.info,
  });
}

final List<TitleAndInfoModel> allTitleAndInfos = [
  TitleAndInfoModel(title: "Адрес", info: "Ул. Алтымышева 33"),
  TitleAndInfoModel(title: "Оплатил", info: "Мистер Х"),
  TitleAndInfoModel(title: "Лиц счет", info: "218481264912401874"),
  TitleAndInfoModel(title: "Время оплаты", info: "8.09.2022 12:55"),
  TitleAndInfoModel(title: "Сумма", info: "14000.00"),
  TitleAndInfoModel(title: "Сумма включая комиссию", info: "14000.00"),
];
