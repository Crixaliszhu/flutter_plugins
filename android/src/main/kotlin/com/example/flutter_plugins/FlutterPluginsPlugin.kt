package com.example.flutter_plugins

import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** Main Android entry for the flutter_plugins package. */
class FlutterPluginsPlugin : FlutterPlugin, MethodCallHandler {
    private companion object {
        const val TAG = "ZcLogPluginReport"
    }

    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "zc_log")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "report" -> {
                val type = call.argument<String>("type").orEmpty()
                val message = call.argument<String>("message").orEmpty()
                Log.e(TAG, "type: $type, message: $message")
                result.success("Android - $type report success")
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
