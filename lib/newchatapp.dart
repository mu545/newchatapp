
import 'dart:async';

import 'package:flutter/services.dart';

class Newchatapp {
  static const MethodChannel _channel = MethodChannel('newchatapp');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
