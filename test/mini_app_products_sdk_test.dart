import 'package:flutter_test/flutter_test.dart';
import 'package:mini_app_products_sdk/mini_app_products_sdk.dart';
import 'package:mini_app_products_sdk/mini_app_products_sdk_platform_interface.dart';
import 'package:mini_app_products_sdk/mini_app_products_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMiniAppProductsSdkPlatform
    with MockPlatformInterfaceMixin
    implements MiniAppProductsSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MiniAppProductsSdkPlatform initialPlatform = MiniAppProductsSdkPlatform.instance;

  test('$MethodChannelMiniAppProductsSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMiniAppProductsSdk>());
  });

  test('getPlatformVersion', () async {
    MiniAppProductsSdk miniAppProductsSdkPlugin = MiniAppProductsSdk();
    MockMiniAppProductsSdkPlatform fakePlatform = MockMiniAppProductsSdkPlatform();
    MiniAppProductsSdkPlatform.instance = fakePlatform;

    expect(await miniAppProductsSdkPlugin.getPlatformVersion(), '42');
  });
}
