import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_app_products_sdk/mini_app_products_sdk_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelMiniAppProductsSdk platform = MethodChannelMiniAppProductsSdk();
  const MethodChannel channel = MethodChannel('mini_app_products_sdk');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
