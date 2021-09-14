
import 'dart:async';

import 'package:flutter/services.dart';

import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX

final DynamicLibrary nativeAddLib = Platform.isAndroid
    ? DynamicLibrary.open("libnative_add.so")
    : DynamicLibrary.process();

final double Function(double x, double y) nativeAdd =
  nativeAddLib
    .lookup<NativeFunction<double Function(double, double)>>('double_multiply')
    .asFunction<double>();



class NativeAdd {
  static const MethodChannel _channel = MethodChannel('double_multiply');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
