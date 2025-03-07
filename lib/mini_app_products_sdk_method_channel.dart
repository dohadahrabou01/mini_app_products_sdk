import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mini_app_products_sdk_platform_interface.dart';

/// An implementation of [MiniAppProductsSdkPlatform] that uses method channels.
class MethodChannelMiniAppProductsSdk extends MiniAppProductsSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mini_app_products_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
