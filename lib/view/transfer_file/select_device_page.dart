import 'package:flutter/material.dart';
import 'package:transfer_file/model/device.dart';
import 'package:transfer_file/view/result/transfer_result.dart';
import 'package:transfer_file/view/transfer_file/select_file_page.dart';

class SelectDevicePage extends StatefulWidget {
  static const String routeName = "select-device";

  const SelectDevicePage({Key? key}) : super(key: key);

  @override
  State<SelectDevicePage> createState() => _SelectDevicePageState();
}

class _SelectDevicePageState extends State<SelectDevicePage> {
  Device? selectedDevice;

  @override
  Widget build(BuildContext context) {
    List<Device> deviceList = ModalRoute.of(context)!.settings.arguments as List<Device>;
    return Scaffold(
      appBar: AppBar(title: const Text("Select Device")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: deviceList.length,
              itemBuilder: (context, index) {
                Device device = deviceList[index];
                return ListTile(
                  onTap: () {
                    setState(() {
                      selectedDevice = device;
                    });
                  },
                  selected: device == selectedDevice,
                  selectedColor: Colors.blue,
                  title: Text(device.name),
                );
              },
            ),
          ),
          OutlinedButton(
            onPressed: () {
              if (selectedDevice != null) {
                _openSelectFilePage(context);
              }
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }

  Future _openSelectFilePage(BuildContext context) async {
    TransferResult? transferResult = await Navigator.of(context).pushNamed<TransferResult>(SelectFilePage.routeName, arguments: selectedDevice);
    Navigator.pop(context, transferResult);
  }
}
