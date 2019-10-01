import 'dart:async';

import 'package:flutter/services.dart';

class AirplaneModeDetection {
  static const MethodChannel _channel =
  const MethodChannel('airplane_mode_detection');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void launch({String android, String iOS}) async {
    await _channel.invokeMethod(
        'detectairplane', {'and': android , 'ios': iOS});
    print("launch is success!");
    print(android);
    print(iOS);
  }
}