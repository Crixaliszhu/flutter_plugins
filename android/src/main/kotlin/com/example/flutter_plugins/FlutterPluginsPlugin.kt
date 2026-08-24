package com.example.flutter_plugins

import com.example.flutter_plugins.generated.ZcLogApi
import io.flutter.embedding.engine.plugins.FlutterPlugin

/** Main Android entry for the flutter_plugins package. */
class FlutterPluginsPlugin : FlutterPlugin {
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        ZcLogApi.setUp(flutterPluginBinding.binaryMessenger, ZcLogApiImpl())
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        ZcLogApi.setUp(binding.binaryMessenger, null)
    }
}
