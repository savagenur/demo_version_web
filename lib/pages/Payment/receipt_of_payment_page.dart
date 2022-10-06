import 'package:demo_version_web/models/title_and_info_model.dart';
import 'package:demo_version_web/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/build_receipt_table.dart';
import '../../widgets/my_button.dart';

class ReceiptOfPaymentPage extends StatefulWidget {
  const ReceiptOfPaymentPage({Key? key}) : super(key: key);

  @override
  State<ReceiptOfPaymentPage> createState() => _ReceiptOfPaymentPageState();
}

class _ReceiptOfPaymentPageState extends State<ReceiptOfPaymentPage> {
  late List<TitleAndInfoModel> titleAndInfos;
  @override
  void initState() {
    titleAndInfos = List.of(allTitleAndInfos);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Квитанция об оплате"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          
          child: Column(
            children: [
              buildReceiptTable(context,titleAndInfos),
              Spacer(),
              Row(
                children: [
                  Spacer(flex: 10,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Text("Оплачено",style: Theme.of(context).textTheme.headline4,),
                  ),
                  Spacer(flex: 1,),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyButton(
            onTap: () {},
            width: 180,
            fontSize: 16,
            icon: Icons.share,
            text: "Поделиться квитанцией",
          ),
    );
  }

  

  Padding buildRowButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 1),
          MyButton(
            onTap: () => Navigator.of(context).pushNamed('/check'),
            fontSize: 16,
            width: 180,
            icon: Icons.home_outlined,
            text: "Выйти на главную",
          ),
          Spacer(flex: 8),
          MyButton(
            onTap: () {},
            width: 180,
            fontSize: 16,
            icon: Icons.share,
            text: "Поделиться квитанцией",
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
