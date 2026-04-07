import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'spotinfo_flutter_plugin_method_channel.dart';

abstract class SpotinfoFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a SpotinfoFlutterPluginPlatform.
  SpotinfoFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SpotinfoFlutterPluginPlatform _instance = MethodChannelSpotinfoFlutterPlugin();

  /// The default instance of [SpotinfoFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelSpotinfoFlutterPlugin].
  static SpotinfoFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SpotinfoFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(SpotinfoFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
