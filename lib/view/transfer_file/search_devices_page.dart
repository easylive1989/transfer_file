import 'package:flutter/material.dart';
import 'package:transfer_file/model/device.dart';
import 'package:transfer_file/view/result/transfer_result.dart';
import 'package:transfer_file/view/transfer_file/select_device_page.dart';

class SearchDevicesPage extends StatelessWidget {
  static const String routeName = "search-device";

  const SearchDevicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Devices")),
      body: FutureBuilder<List<Device>>(
        future: _searchDevices(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const Expanded(child: Center(child: Text("Searched finish"))),
                OutlinedButton(
                  onPressed: () => _openSelectDevicePage(context, snapshot),
                  child: const Text("Next"),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(child: CircularProgressIndicator()),
                Text("Searching device..."),
              ],
            );
          }
        },
      ),
    );
  }

  Future _openSelectDevicePage(BuildContext context, AsyncSnapshot<List<Device>> snapshot) async {
    TransferAction? transferAction =
        await Navigator.of(context).pushNamed<TransferAction>(SelectDevicePage.routeName, arguments: snapshot.data);
    Navigator.of(context).pop(transferAction);
  }

  Future<List<Device>> _searchDevices() async {
    await Future.delayed(const Duration(seconds: 3));
    return [
      Device("Alice's Phone"),
      Device("Bob's Phone"),
      Device("Michael's Phone"),
    ];
  }
}
