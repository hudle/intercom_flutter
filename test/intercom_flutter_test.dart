import 'package:flutter_test/flutter_test.dart';
import 'package:intercom_flutter/intercom_flutter.dart';
import 'package:intercom_flutter/intercom_flutter_platform_interface.dart';
import 'package:intercom_flutter/intercom_flutter_method_channel.dart';
import 'package:intercom_flutter/src/registration.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIntercomFlutterPlatform 
    with MockPlatformInterfaceMixin
    implements IntercomFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> initialize(String apiKey, String appId) {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<void> logEvent(String eventName, Map<String, dynamic> metaData) {
    // TODO: implement logEvent
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> registerIdentifiedUser(Registration registration) {
    // TODO: implement registerIdentifiedUser
    throw UnimplementedError();
  }
}

void main() {
  final IntercomFlutterPlatform initialPlatform = IntercomFlutterPlatform.instance;

  test('$MethodChannelIntercomFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIntercomFlutter>());
  });

  test('getPlatformVersion', () async {
    IntercomFlutter intercomFlutterPlugin = IntercomFlutter();
    MockIntercomFlutterPlatform fakePlatform = MockIntercomFlutterPlatform();
    IntercomFlutterPlatform.instance = fakePlatform;
  
    //expect(await intercomFlutterPlugin.getPlatformVersion(), '42');
  });
}
