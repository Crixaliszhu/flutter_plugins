#include "include/flutter_plugins/flutter_plugins_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_plugins_plugin.h"

void FlutterPluginsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_plugins::FlutterPluginsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
