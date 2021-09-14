
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX


final DynamicLibrary nativeAddLib = Platform.isAndroid
    ? DynamicLibrary.open("libnative_add.so")
    : DynamicLibrary.process();

typedef hello_world_func = Double Function(Double,Double);

final double Function(double,double) nativeAdd =
  nativeAddLib
    .lookup<NativeFunction<hello_world_func>>('double_multiply')
    .asFunction();

    



class NativeAdd {
  static const MethodChannel _channel = MethodChannel('double_multiply');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
