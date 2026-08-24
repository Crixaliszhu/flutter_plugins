import 'package:flutter_plugins/src/generated/zc_log_api.g.dart';

class FlutterPluginsPlugin {
  FlutterPluginsPlugin({ZcLogApi? zcLogApi})
      : _zcLogApi = zcLogApi ?? ZcLogApi();

  final ZcLogApi _zcLogApi;

  Future<String> report(String type, String message) =>
      _zcLogApi.report(type, message);
}
