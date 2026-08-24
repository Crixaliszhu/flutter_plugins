import 'package:flutter_plugins/common_utils/zc_log_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZcLogInterface extends PlatformInterface {
  ZcLogInterface() : super(token: _token);

  static final Object _token = Object();

  static ZcLogInterface _instance = MethodChannelLogPlugins();

  static ZcLogInterface get instance => _instance;

  static set instance(ZcLogInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> repost(String type, String message) {
    throw UnimplementedError('ZcLogInterface.repost() 未实现!!!');
  }
}
