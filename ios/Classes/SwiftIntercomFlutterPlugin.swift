import Flutter
import UIKit
import Intercom

public class SwiftIntercomFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "intercom_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftIntercomFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    

        print("Calling method \(String(describing: method))")

         let method = call.method
         let arguments = call.arguments as? NSDictionary

         switch method {
         case "initialize":
             if let apiKey = arguments?["apiKey"] as? String,
                 let appId = arguments?["appId"] as? String {
                 Intercom.setApiKey(apiKey, forAppId: appId)
                 result("Initialize Success")
             }

             result("apiKey or appId was not passed correctly")
         case "registerIdentifiedUser":
             if let userId = arguments?["userId"] as? String {
                 Intercom.registerUser(withUserId: userId)
                 result("Success registerIdentifiedUser")
             }
                   
            result("User ID not found")
                    
         case "logEvent":
             let eventName = arguments?["event"] as! String
             let meta = arguments?["meta"] as! [AnyHashable : Any]?
             Intercom.logEvent(withName: eventName, metaData: meta!)
             
          
             
             result("Event sent to \(eventName)")
             
             
             
         case "logout":
             Intercom.logout()
             result("Logout success")
         default:
     //        result(FlutterMethodNotImplemented("Method \(method) was not implemented"))
             result("error")
         }
  }
}
