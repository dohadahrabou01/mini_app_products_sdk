//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <mini_app_products_sdk/mini_app_products_sdk_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) mini_app_products_sdk_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MiniAppProductsSdkPlugin");
  mini_app_products_sdk_plugin_register_with_registrar(mini_app_products_sdk_registrar);
}
