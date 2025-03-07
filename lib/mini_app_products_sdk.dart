
import 'mini_app_products_sdk_platform_interface.dart';

class MiniAppProductsSdk {
  Future<String?> getPlatformVersion() {
    return MiniAppProductsSdkPlatform.instance.getPlatformVersion();
  }
}
