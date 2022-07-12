
import 'package:flutter/foundation.dart';

import 'intercom_flutter_platform_interface.dart';
import 'src/registration.dart';
export 'src/registration.dart';

class IntercomFlutter {

  Future<void> registerIdentifiedUser(Registration registration)  {
    return  IntercomFlutterPlatform.instance.registerIdentifiedUser(registration);
  }

  Future<void> logEvent(String eventName, Map<String, dynamic> metaData) {
    return IntercomFlutterPlatform.instance.logEvent(eventName, metaData);
  }

  Future<void> logout() {
    return IntercomFlutterPlatform.instance.logout();
  }

  Future<void> initialize({required String apiKey, required String appId}) {
    return IntercomFlutterPlatform.instance.initialize(apiKey, appId);
  }
}
