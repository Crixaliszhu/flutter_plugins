
import 'flutter_plugins_platform_interface.dart';

class FlutterPlugins {
  Future<String?> getPlatformVersion() {
    return FlutterPluginsPlatform.instance.getPlatformVersion();
  }
}
