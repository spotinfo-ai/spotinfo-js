import 'package:flutter_test/flutter_test.dart';
import 'package:spotinfo_flutter_plugin/spotinfo_flutter_plugin.dart';
import 'package:spotinfo_flutter_plugin/spotinfo_flutter_plugin_platform_interface.dart';
import 'package:spotinfo_flutter_plugin/spotinfo_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSpotinfoFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements SpotinfoFlutterPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SpotinfoFlutterPluginPlatform initialPlatform = SpotinfoFlutterPluginPlatform.instance;

  test('$MethodChannelSpotinfoFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSpotinfoFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    SpotinfoFlutterPlugin spotinfoFlutterPlugin = SpotinfoFlutterPlugin();
    MockSpotinfoFlutterPluginPlatform fakePlatform = MockSpotinfoFlutterPluginPlatform();
    SpotinfoFlutterPluginPlatform.instance = fakePlatform;

    expect(await spotinfoFlutterPlugin.getPlatformVersion(), '42');
  });
}
