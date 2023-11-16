import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'jdkit_platform_interface.dart';

/// An implementation of [JdkitPlatform] that uses method channels.
class MethodChannelJdkit extends JdkitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('jdkit');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Map?> init(appKey, appSecretKey) async {
    final result = await methodChannel.invokeMethod<Map>(
        'init', {"appKey": appKey, "appSecretKey": appSecretKey});
    return result;
  }

  @override
  Future<Map?> openJDUrl(url, {Map? userInfo}) async {
    final result = await methodChannel.invokeMethod<Map>('openJDUrl',
        userInfo == null ? {"url": url} : {"url": url, "userInfo": userInfo});
    return result;
  }

  @override
  Future<Map?> openJXUrl(url, {Map? userInfo}) async {
    final result = await methodChannel.invokeMethod<Map>('openJXUrl',
        userInfo == null ? {"url": url} : {"url": url, "userInfo": userInfo});
    return result;
  }
}
