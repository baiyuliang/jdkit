import 'jdkit_platform_interface.dart';

class Jdkit {
  Future<String?> getPlatformVersion() {
    return JdkitPlatform.instance.getPlatformVersion();
  }

  Future<Map?> init(appKey, appSecretKey) {
    return JdkitPlatform.instance.init(appKey, appSecretKey);
  }

  Future<Map?> openJDUrl(url, {Map? userInfo}) {
    return JdkitPlatform.instance.openJDUrl(url, userInfo:userInfo);
  }

  Future<Map?> openJXUrl(url, {Map? userInfo}) {
    return JdkitPlatform.instance.openJXUrl(url, userInfo: userInfo);
  }
}
