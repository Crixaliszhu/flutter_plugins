import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_plugins_method_channel.dart';

abstract class FlutterPluginsPlatform extends PlatformInterface {
  /// Constructs a FlutterPluginsPlatform.
  FlutterPluginsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPluginsPlatform _instance = MethodChannelFlutterPlugins();

  /// The default instance of [FlutterPluginsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPlugins].
  static FlutterPluginsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPluginsPlatform] when
  /// they register themselves.
  static set instance(FlutterPluginsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
