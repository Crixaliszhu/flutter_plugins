import 'package:flutter_plugins/common_utils/zc_log_interface.dart';

class FlutterPluginsPlugin {
  Future<String?> report(String type, String message) {
    return ZcLogInterface.instance.repost(type, message);
  }
}
