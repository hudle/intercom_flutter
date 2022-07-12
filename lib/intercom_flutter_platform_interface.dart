import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'intercom_flutter_method_channel.dart';
import 'src/registration.dart';

abstract class IntercomFlutterPlatform extends PlatformInterface {
  /// Constructs a IntercomFlutterPlatform.
  IntercomFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static IntercomFlutterPlatform _instance = MethodChannelIntercomFlutter();

  /// The default instance of [IntercomFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelIntercomFlutter].
  static IntercomFlutterPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IntercomFlutterPlatform] when
  /// they register themselves.
  static set instance(IntercomFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize(String apiKey, String appId);

  Future<void> registerIdentifiedUser(Registration registration);

  Future<void> logout();

  Future<void> logEvent(String eventName, Map<String, dynamic> metaData);
}
