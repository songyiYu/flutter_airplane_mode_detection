import Flutter
import UIKit
import Network

@available(iOS 12.0, *)
public class SwiftAirplaneModeDetectionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "airplane_mode_detection", binaryMessenger: registrar.messenger())
    let instance = SwiftAirplaneModeDetectionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   if (call.method == "getPlatformVersion"){
                result("iOS" + UIDevice.current.systemVersion)
            }else if (call.method == "detectairplane") {
               guard let args = call.arguments else {
                           return
                       }
                       if let myArgs = args as? [String: Any],
                           let check = myArgs["ios"] as? String{
                           if check == "iOSCheck"{
                           result(self.detectairplane())
                           }
                       }

          }
        }
    public override init() {
                super.init()
            }

            func detectairplane() -> Bool {


                    var check = true
                    let monitor = NWPathMonitor()

                    monitor.pathUpdateHandler = { path in
                        if path.availableInterfaces.count == 0 {
                            check = true
                            print("Flight mode")
                        }
                        else {
                            check = false
                            print("not Flight mode")
                        }
                        print(path.availableInterfaces)
                    }

                    let queue = DispatchQueue.global(qos: .background)
                    monitor.start(queue: queue)
                    return check
                }
}
