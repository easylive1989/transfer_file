import 'package:flutter/material.dart';
import 'package:transfer_file/view/home_page.dart';
import 'package:transfer_file/view/exception/route_not_found_exception.dart';
import 'package:transfer_file/view/result/transfer_result.dart';
import 'package:transfer_file/view/transfer_file/transfer_file_flow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Transfer File",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route _onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == HomePage.routeName) {
      return MaterialPageRoute(builder: (BuildContext context) => const HomePage());
    } else if (routeSettings.name == TransferFileFlow.routeName) {
      return MaterialPageRoute<TransferResult>(builder: (BuildContext context) => const TransferFileFlow());
    }
    throw RouteNotFoundException("Need to implement ${routeSettings.name}");
  }
}
