import 'package:flutter/material.dart';
import 'package:transfer_file/view/home_page.dart';
import 'package:transfer_file/view/exception/route_not_found_exception.dart';
import 'package:transfer_file/view/result/transfer_result.dart';
import 'package:transfer_file/view/transfer_file/search_devices_page.dart';
import 'package:transfer_file/view/transfer_file/select_device_page.dart';
import 'package:transfer_file/view/transfer_file/select_file_page.dart';

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
    } else if (routeSettings.name == SearchDevicesPage.routeName) {
      return MaterialPageRoute<TransferResult>(
        builder: (BuildContext context) => const SearchDevicesPage(),
        settings: routeSettings,
      );
    } else if (routeSettings.name == SelectDevicePage.routeName) {
      return MaterialPageRoute<TransferResult>(
        builder: (BuildContext context) => const SelectDevicePage(),
        settings: routeSettings,
      );
    } else if (routeSettings.name == SelectFilePage.routeName) {
      return MaterialPageRoute<TransferResult>(
        builder: (BuildContext context) => const SelectFilePage(),
        settings: routeSettings,
      );
    }
    throw RouteNotFoundException("Need to implement ${routeSettings.name}");
  }
}
