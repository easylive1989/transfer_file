import 'package:flutter/material.dart';
import 'package:transfer_file/model/file.dart';
import 'package:transfer_file/view/exception/route_not_found_exception.dart';
import 'package:transfer_file/view/result/transfer_result.dart';
import 'package:transfer_file/view/transfer_file/search_devices_page.dart';
import 'package:transfer_file/view/transfer_file/select_device_page.dart';
import 'package:transfer_file/view/transfer_file/select_file_page.dart';

import '../../model/device.dart';

class TransferFileFlow extends StatefulWidget {
  static const String routeName = "transfer-file-flow";

  const TransferFileFlow({Key? key}) : super(key: key);

  @override
  State<TransferFileFlow> createState() => _TransferFileFlowState();
}

class _TransferFileFlowState extends State<TransferFileFlow> {
  final GlobalKey<NavigatorState> _nestedNavigatorKey = GlobalKey<NavigatorState>();
  late List<Device> searchedDevices;
  late Device selectedDevice;
  late File selectedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _nestedNavigatorKey,
        initialRoute: SearchDevicesPage.routeName,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  void _onDevicesSearched(List<Device> devices) {
    searchedDevices = devices;
    _nestedNavigatorKey.currentState?.pushNamed(SelectDevicePage.routeName);
  }

  void _onSearchDevicesPageClose() {
    Navigator.of(context).pop();
  }

  void _onDeviceSelected(Device device) {
    selectedDevice = device;
    _nestedNavigatorKey.currentState?.pushNamed(SelectFilePage.routeName);
  }

  Future _onFileSelected(File file) async {
    selectedFile = file;
    await _transfer(selectedDevice, selectedFile);
    Navigator.of(context).pop(TransferResult.success);
  }

  Future _transfer(Device selectedDevice, File selectedFile) async {
    print("transfer ${selectedFile.name} to ${selectedDevice.name}");
  }

  Route _onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == SearchDevicesPage.routeName) {
      return MaterialPageRoute(
        builder: (BuildContext context) => SearchDevicesPage(
          onBack: _onSearchDevicesPageClose,
          onDevicesSearched: _onDevicesSearched,
        ),
      );
    } else if (routeSettings.name == SelectDevicePage.routeName) {
      return MaterialPageRoute(
        builder: (BuildContext context) => SelectDevicePage(
          searchedDevices: searchedDevices,
          onDeviceSelected: _onDeviceSelected,
        ),
      );
    } else if (routeSettings.name == SelectFilePage.routeName) {
      return MaterialPageRoute(
        builder: (BuildContext context) => SelectFilePage(
          onFileSelected: _onFileSelected,
        ),
      );
    }
    throw RouteNotFoundException("Need to implement ${routeSettings.name}");
  }
}
