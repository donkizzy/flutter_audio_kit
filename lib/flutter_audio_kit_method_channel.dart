import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_audio_kit_platform_interface.dart';

/// An implementation of [FlutterAudioKitPlatform] that uses method channels.
class MethodChannelFlutterAudioKit extends FlutterAudioKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_audio_kit');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
