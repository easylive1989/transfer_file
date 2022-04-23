import 'package:flutter/material.dart';
import 'package:transfer_file/model/device.dart';
import 'package:transfer_file/model/file.dart';
import 'package:transfer_file/view/transfer_file/search_devices_page.dart';

import 'result/transfer_action.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "home";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Center(child: Text("Click + to transfer file to your friend.")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openSearchDevicePage(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future _openSearchDevicePage(BuildContext context) async {
    TransferAction? transferAction = await Navigator.of(context).pushNamed<TransferAction>(SearchDevicesPage.routeName);
    if (transferAction != null) {
      await _transfer(transferAction.device, transferAction.file);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Transfer success")));
    }
  }

  Future _transfer(Device selectedDevice, File selectedFile) async {
    print("transfer ${selectedFile.name} to ${selectedDevice.name}");
  }
}
