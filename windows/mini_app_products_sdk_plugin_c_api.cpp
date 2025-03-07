#include "include/mini_app_products_sdk/mini_app_products_sdk_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "mini_app_products_sdk_plugin.h"

void MiniAppProductsSdkPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  mini_app_products_sdk::MiniAppProductsSdkPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
