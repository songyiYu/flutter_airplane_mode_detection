import 'dart:async';

import 'package:flutter/services.dart';

class AirplaneModeDetection {
  static const MethodChannel _channel =
  const MethodChannel('flutter.moum.airplane_mode_detection');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void launch() async {
    await _channel.invokeMethod(
        'detectairplane');
    print("launch is success!");
  }
}