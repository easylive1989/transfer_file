import 'package:transfer_file/model/device.dart';
import 'package:transfer_file/model/file.dart';

class TransferAction {
  final Device device;
  final File file;

  TransferAction(this.device, this.file);
}