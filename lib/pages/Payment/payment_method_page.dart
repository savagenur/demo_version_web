import 'package:demo_version_web/utils/constants.dart';
import 'package:demo_version_web/widgets/my_button.dart';
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  static const paymentMethods = [
    "О! деньги",
    "Умай",
    "Элсом",
    "Элкарт",
    "Balance",
    "Pay 24",
    "Visa/mastercard",
    "МБанк"
  ];
  var selectedValue = paymentMethods.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Выберите способ оплаты:"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            buildPaymentMethodsList(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "(Итого: 14000)",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 5,
            ),
            MyButton(
                width: MediaQuery.of(context).size.width,
                icon: Icons.payment_outlined,
                text: "Оплатить",
                onTap: () {
                  buildDialog(context);
                }),
          ],
        ),
      ),
    );
  }

  Column buildPaymentMethodsList() {
    int index = -1;

    return Column(
      children: paymentMethods.map((paymentMethod) {
        index++;
        return RadioListTile(
            value: paymentMethod,
            tileColor: index.isEven ? Colors.grey[200] : Colors.grey[300],
            groupValue: selectedValue,
            title: Text(
              paymentMethod,
              style: Theme.of(context).textTheme.headline5,
            ),
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            });
      }).toList(),
    );
  }

  buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            title: const Text('Подтвердите оплату'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Отмена')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/receipt-of-payment');
                  },
                  child: Text('Оплатить')),
            ],
          );
        });
  }
}
