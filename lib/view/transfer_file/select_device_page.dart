import 'package:flutter/material.dart';
import 'package:transfer_file/model/device.dart';

class SelectDevicePage extends StatefulWidget {
  static const String routeName = "select-device";
  final List<Device> searchedDevices;
  final Function(Device) onDeviceSelected;

  const SelectDevicePage({
    Key? key,
    required this.onDeviceSelected,
    required this.searchedDevices,
  }) : super(key: key);

  @override
  State<SelectDevicePage> createState() => _SelectDevicePageState();
}

class _SelectDevicePageState extends State<SelectDevicePage> {
  Device? selectedDevice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Device")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.searchedDevices.length,
              itemBuilder: (context, index) {
                Device device = widget.searchedDevices[index];
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
                widget.onDeviceSelected(selectedDevice!);
              }
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
