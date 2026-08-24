import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/generated/zc_log_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/src/main/kotlin/com/example/flutter_plugins/generated/ZcLogApi.g.kt',
    kotlinOptions: KotlinOptions(
      package: 'com.example.flutter_plugins.generated',
    ),
    dartPackageName: 'flutter_plugins',
  ),
)
@HostApi()
abstract class ZcLogApi {
  String report(String type, String message);
}
