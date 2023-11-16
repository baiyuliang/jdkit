import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'jdkit_method_channel.dart';

abstract class JdkitPlatform extends PlatformInterface {
  /// Constructs a JdkitPlatform.
  JdkitPlatform() : super(token: _token);

  static final Object _token = Object();

  static JdkitPlatform _instance = MethodChannelJdkit();

  /// The default instance of [JdkitPlatform] to use.
  ///
  /// Defaults to [MethodChannelJdkit].
  static JdkitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [JdkitPlatform] when
  /// they register themselves.
  static set instance(JdkitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map?> init(appKey,appSecretKey) {
    throw UnimplementedError('init() has not been implemented.');
  }

  Future<Map?> openJDUrl(url, {Map? userInfo}) async {
    throw UnimplementedError('openJDUrl() has not been implemented.');
  }

  Future<Map?> openJXUrl(url, {Map? userInfo}) async {
    throw UnimplementedError('openJXUrl() has not been implemented.');
  }
}
