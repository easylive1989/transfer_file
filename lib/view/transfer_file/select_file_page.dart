import 'package:flutter/material.dart';
import 'package:transfer_file/model/file.dart';

class SelectFilePage extends StatefulWidget {
  static const String routeName = "select-file";
  final Function(File) onFileSelected;

  const SelectFilePage({
    Key? key,
    required this.onFileSelected,
  }) : super(key: key);

  @override
  State<SelectFilePage> createState() => _SelectFilePageState();
}

class _SelectFilePageState extends State<SelectFilePage> {
  File? selectedFile;

  @override
  Widget build(BuildContext context) {
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
                widget.onFileSelected(selectedFile!);
              }
            },
            child: const Text("Transfer"),
          ),
        ],
      ),
    );
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
