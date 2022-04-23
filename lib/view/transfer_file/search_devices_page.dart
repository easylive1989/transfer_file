import 'package:flutter/material.dart';
import 'package:transfer_file/model/device.dart';

class SearchDevicesPage extends StatelessWidget {
  static const String routeName = "search-device";
  final VoidCallback onBack;
  final Function(List<Device> devices) onDevicesSearched;

  const SearchDevicesPage({
    Key? key,
    required this.onBack,
    required this.onDevicesSearched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onBack
          ),
          title: const Text("Search Devices")),
      body: FutureBuilder<List<Device>>(
        future: _searchDevices(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const Expanded(child: Center(child: Text("Finish searching"))),
                OutlinedButton(
                  onPressed: () => onDevicesSearched(snapshot.data!),
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

  Future<List<Device>> _searchDevices() async {
    await Future.delayed(const Duration(seconds: 3));
    return [
      Device("Alice's Phone"),
      Device("Bob's Phone"),
      Device("Michael's Phone"),
    ];
  }
}
