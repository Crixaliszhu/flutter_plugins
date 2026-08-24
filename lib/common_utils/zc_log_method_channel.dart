import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show MethodChannel;
import 'package:flutter_plugins/common_utils/zc_log_interface.dart';

class MethodChannelLogPlugins extends ZcLogInterface {
  /// 与原生平台交互的方法通道
  @visibleForTesting
  final methodChannel = const MethodChannel('zc_log');

  @override
  Future<String?> report(String type, String message) {
    return methodChannel.invokeMethod<String>('report', <String, String>{
      'type': type,
      'message': message,
    });
  }
}
