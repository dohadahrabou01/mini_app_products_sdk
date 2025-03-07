import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mini_app_products_sdk_method_channel.dart';

abstract class MiniAppProductsSdkPlatform extends PlatformInterface {
  /// Constructs a MiniAppProductsSdkPlatform.
  MiniAppProductsSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static MiniAppProductsSdkPlatform _instance = MethodChannelMiniAppProductsSdk();

  /// The default instance of [MiniAppProductsSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelMiniAppProductsSdk].
  static MiniAppProductsSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MiniAppProductsSdkPlatform] when
  /// they register themselves.
  static set instance(MiniAppProductsSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
