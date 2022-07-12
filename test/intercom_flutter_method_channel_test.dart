import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intercom_flutter/intercom_flutter_method_channel.dart';

void main() {
  MethodChannelIntercomFlutter platform = MethodChannelIntercomFlutter();
  const MethodChannel channel = MethodChannel('intercom_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await platform.getPlatformVersion(), '42');
  // });
}
