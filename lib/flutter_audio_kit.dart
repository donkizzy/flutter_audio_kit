
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter_audio_kit/enums.dart';
import 'flutter_audio_kit_platform_interface.dart';

class FlutterAudioKit {
  Future<String?> getPlatformVersion() {
    return FlutterAudioKitPlatform.instance.getPlatformVersion();
  }


  Future<ReturnCode> videoToAudio({required String inputPath, required String outputPath, AudioType audioType = AudioType.aac})async{
    var session = await FFmpegKit.execute('-i "$inputPath" -vn -acodec copy $outputPath');
    return await session.getReturnCode()  ?? ReturnCode(255);
  }
}

