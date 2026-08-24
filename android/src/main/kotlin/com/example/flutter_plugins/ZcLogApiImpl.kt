package com.example.flutter_plugins

import android.util.Log
import com.example.flutter_plugins.generated.ZcLogApi

class ZcLogApiImpl : ZcLogApi {
    override fun report(type: String, message: String): String {
        Log.e(TAG, "type: $type, message: $message")
        return "Android - $type report success"
    }

    private companion object {
        const val TAG = "ZcLogPluginReport"
    }
}
