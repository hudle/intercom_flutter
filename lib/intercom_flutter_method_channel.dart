import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:intercom_flutter/src/registration.dart';

import 'intercom_flutter_platform_interface.dart';

/// An implementation of [IntercomFlutterPlatform] that uses method channels.
class MethodChannelIntercomFlutter extends IntercomFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('intercom_flutter');

  @override
  Future<void> registerIdentifiedUser(Registration registration) async{
    final s = await methodChannel.invokeMethod('registerIdentifiedUser', registration.toJson());
    debugPrint(s);
    return;
  }

  @override
  Future<void> logEvent(String eventName, Map<String, dynamic> metaData) async {
    final s = await  methodChannel.invokeMethod('logEvent', {'event' : eventName, 'meta' : metaData});
    debugPrint(s);
    return;
  }

  @override
  Future<void> logout() async {
    final s = await methodChannel.invokeMethod('logout');
    debugPrint(s);
    return;
  }

  @override
  Future<void> initialize(String apiKey, String appId) async {
    final s=  await methodChannel.invokeMethod('initialize', {
      'apiKey' : apiKey,
      'appId' : appId,
    });
    debugPrint(s);
    return;
  }
}
