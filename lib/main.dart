import 'package:demo_version_web/pages/Payment/check_page.dart';
import 'package:demo_version_web/pages/Payment/payment_method_page.dart';
import 'package:demo_version_web/pages/Payment/receipt_of_payment_page.dart';
import 'package:demo_version_web/pages/calculation_page.dart';
import 'package:demo_version_web/pages/create_review_page.dart';
import 'package:demo_version_web/pages/detailed_check_page.dart';
import 'package:demo_version_web/pages/home_page.dart';
import 'package:demo_version_web/pages/payment_history_page.dart';
import 'package:demo_version_web/pages/review_page.dart';
import 'package:demo_version_web/utils/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ОО Тосор-Суу',
      theme: lightThemeData,
      routes: {
        '/':(context) =>HomePage(),
        '/review':(context) =>ReviewPage(),
        '/create-review':(context) =>CreateReviewPage(),
        '/check':(context) =>CheckPage(),
        '/payment-method':(context) =>PaymentMethodPage(),
        '/receipt-of-payment':(context) =>ReceiptOfPaymentPage(),
        '/calculation':(context) =>CalculationPage(),
        '/detailed-check':(context) =>DetailedCheckPage(),
        '/payment-history':(context) =>PaymentHistoryPage(),

      },
      
    );
  }
}
