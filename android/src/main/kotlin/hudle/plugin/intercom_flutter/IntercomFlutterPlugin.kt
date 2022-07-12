package hudle.plugin.intercom_flutter

import android.app.Activity
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import io.intercom.android.sdk.Intercom
import io.intercom.android.sdk.UserAttributes
import io.intercom.android.sdk.identity.Registration

/** IntercomFlutterPlugin */
class IntercomFlutterPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var activity: Activity

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "intercom_flutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when(call.method) {
      "initialize" -> {
        val args = call.arguments<Map<String, Any>>()!!
        val appKey = args["apiKey"].toString()
        val appId = args["appId"].toString()

        Intercom.initialize(activity.application, appKey, appId)
        result.success(null)

      }
      "registerIdentifiedUser" -> {

        val args = call.arguments<Map<String, Any>>()!!
        val userId = args["userId"].toString()

        val builder = UserAttributes.Builder()
        if (args.containsKey("attrs")) {
          val attrs = args["attrs"] as Map<*, *>
          if (attrs.containsKey("name")) {
            builder.withName(attrs["name"].toString())
          }
          if (attrs.containsKey("email")) {
            builder.withEmail(attrs["email"].toString())
          }
          if (attrs.containsKey("phone")) {
            builder.withPhone(attrs["phone"].toString())
          }
        }

        val registration = Registration.create()
          .withUserId(userId)
          .withUserAttributes(builder.build())
        Intercom.client().loginIdentifiedUser(registration)
        result.success("Intialize Success")
      }
      "logEvent" -> {
        val args = call.arguments<Map<String, Any>>()!!
        val eventName = args["event"].toString()
        val meta = args["meta"] as Map<String?,*>?

        Intercom.client().logEvent(eventName, meta)
        result.success("Log event ${eventName}")
      }
      "logout" -> {
        Intercom.client().logout()
        result.success("Logout")
      }
      else -> {
        result.notImplemented()
      }
    }
//    if (call.method == "getPlatformVersion") {
//      result.success("Android ${android.os.Build.VERSION.RELEASE}")
//    } else {
//      result.notImplemented()
//    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {

    this.activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {

  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    this.activity = binding.activity
  }

  override fun onDetachedFromActivity() {

  }
}
