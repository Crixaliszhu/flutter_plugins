
import 'package:flutter_plugins/src/zc_log_interface.dart';

class FlutterPluginsPlugin {
  Future<String?> report(String type, String message) {
    return ZcLogInterface.instance.report(type, message);
  }
}
