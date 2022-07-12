#include "include/intercom_flutter/intercom_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "intercom_flutter_plugin.h"

void IntercomFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  intercom_flutter::IntercomFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
