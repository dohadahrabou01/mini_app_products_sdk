#ifndef FLUTTER_PLUGIN_MINI_APP_PRODUCTS_SDK_PLUGIN_H_
#define FLUTTER_PLUGIN_MINI_APP_PRODUCTS_SDK_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace mini_app_products_sdk {

class MiniAppProductsSdkPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MiniAppProductsSdkPlugin();

  virtual ~MiniAppProductsSdkPlugin();

  // Disallow copy and assign.
  MiniAppProductsSdkPlugin(const MiniAppProductsSdkPlugin&) = delete;
  MiniAppProductsSdkPlugin& operator=(const MiniAppProductsSdkPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace mini_app_products_sdk

#endif  // FLUTTER_PLUGIN_MINI_APP_PRODUCTS_SDK_PLUGIN_H_
