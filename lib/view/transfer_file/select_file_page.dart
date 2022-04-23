import 'package:flutter/material.dart';
import 'package:transfer_file/model/device.dart';
import 'package:transfer_file/model/file.dart';
import 'package:transfer_file/view/result/transfer_result.dart';

class SelectFilePage extends StatefulWidget {
  static const String routeName = "select-file";

  const SelectFilePage({Key? key}) : super(key: key);

  @override
  State<SelectFilePage> createState() => _SelectFilePageState();
}

class _SelectFilePageState extends State<SelectFilePage> {
  File? selectedFile;

  @override
  Widget build(BuildContext context) {
    Device selectedDevice = ModalRoute.of(context)!.settings.arguments as Device;
    List<File> files = _getFile();
    return Scaffold(
      appBar: AppBar(title: const Text("Transfer File")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                File file = files[index];
                return ListTile(
                  onTap: () {
                    setState(() {
                      selectedFile = file;
                    });
                  },
                  selected: selectedFile == file,
                  selectedColor: Colors.blue,
                  title: Text(file.name),
                );
              },
            ),
          ),
          OutlinedButton(
            onPressed: () async {
              if (selectedFile != null) {
                await _transfer(selectedDevice, selectedFile!);
                Navigator.pop(context, TransferResult.success);
              }
            },
            child: const Text("Transfer"),
          ),
        ],
      ),
    );
  }

  Future _transfer(Device selectedDevice, File selectedFile) async {
    print("transfer ${selectedFile.name} to ${selectedDevice.name}");
  }

  List<File> _getFile() {
    return const [
      File("File A"),
      File("File B"),
      File("File C"),
      File("File D"),
    ];
  }
}
