import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_audio_kit_method_channel.dart';

abstract class FlutterAudioKitPlatform extends PlatformInterface {
  /// Constructs a FlutterAudioKitPlatform.
  FlutterAudioKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAudioKitPlatform _instance = MethodChannelFlutterAudioKit();

  /// The default instance of [FlutterAudioKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAudioKit].
  static FlutterAudioKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAudioKitPlatform] when
  /// they register themselves.
  static set instance(FlutterAudioKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
