import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_audio_kit/flutter_audio_kit.dart';
import 'package:flutter_audio_kit/flutter_audio_kit_platform_interface.dart';
import 'package:flutter_audio_kit/flutter_audio_kit_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAudioKitPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAudioKitPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAudioKitPlatform initialPlatform = FlutterAudioKitPlatform.instance;

  test('$MethodChannelFlutterAudioKit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAudioKit>());
  });

  test('getPlatformVersion', () async {
    FlutterAudioKit flutterAudioKitPlugin = FlutterAudioKit();
    MockFlutterAudioKitPlatform fakePlatform = MockFlutterAudioKitPlatform();
    FlutterAudioKitPlatform.instance = fakePlatform;

    expect(await flutterAudioKitPlugin.getPlatformVersion(), '42');
  });
}
