#ifndef FLUTTER_PLUGIN_INTERCOM_FLUTTER_PLUGIN_H_
#define FLUTTER_PLUGIN_INTERCOM_FLUTTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace intercom_flutter {

class IntercomFlutterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  IntercomFlutterPlugin();

  virtual ~IntercomFlutterPlugin();

  // Disallow copy and assign.
  IntercomFlutterPlugin(const IntercomFlutterPlugin&) = delete;
  IntercomFlutterPlugin& operator=(const IntercomFlutterPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace intercom_flutter

#endif  // FLUTTER_PLUGIN_INTERCOM_FLUTTER_PLUGIN_H_
