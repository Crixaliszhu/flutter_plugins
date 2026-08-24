import 'package:flutter_plugins/common_utils/zc_log_plugins.dart';
import 'package:flutter_plugins/flutter_plugins_method_channel.dart';
import 'package:flutter_plugins/flutter_plugins_platform_interface.dart';
import 'package:flutter_plugins/src/generated/zc_log_api.g.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPluginsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPluginsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final FlutterPluginsPlatform initialPlatform =
      FlutterPluginsPlatform.instance;

  test('$MethodChannelFlutterPlugins is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPlugins>());
  });

  test('report', () async {
    const channel = BasicMessageChannel<Object?>(
      'dev.flutter.pigeon.flutter_plugins.ZcLogApi.report',
      ZcLogApi.pigeonChannelCodec,
    );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockDecodedMessageHandler<Object?>(channel,
            (Object? message) async {
      final args = message! as List<Object?>;
      return <Object?>['${args[0]}:${args[1]}'];
    });

    FlutterPluginsPlugin flutterPluginsPlugin = FlutterPluginsPlugin();

    expect(
      await flutterPluginsPlugin.report('warning', '警告日志输出'),
      'warning:警告日志输出',
    );

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockDecodedMessageHandler<Object?>(channel, null);
  });
}
