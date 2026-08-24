import 'package:flutter_plugins/common_utils/zc_log_plugins.dart';
import 'package:flutter_plugins/flutter_plugins_method_channel.dart';
import 'package:flutter_plugins/flutter_plugins_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPluginsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPluginsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPluginsPlatform initialPlatform =
      FlutterPluginsPlatform.instance;

  test('$MethodChannelFlutterPlugins is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPlugins>());
  });

  test('getPlatformVersion', () async {
    ZcLogPlugins flutterPluginsPlugin = ZcLogPlugins();
    MockFlutterPluginsPlatform fakePlatform = MockFlutterPluginsPlatform();
    FlutterPluginsPlatform.instance = fakePlatform;

    expect(await flutterPluginsPlugin.report('warning', '警告日志输出'), '42');
  });
}
