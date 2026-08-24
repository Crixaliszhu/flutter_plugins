import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_plugins_platform_interface.dart';

/// An implementation of [FlutterPluginsPlatform] that uses method channels.
class MethodChannelFlutterPlugins extends FlutterPluginsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_plugins');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
