
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ultralytics_yolo/predict/detect/detect.dart';
import 'package:ultralytics_yolo/yolo_model.dart';


Future<String> get_class_name(io.File image) async {
  final model = LocalYoloModel(
    id: '',
    task: Task.detect ,
    format: Format.tflite,
    modelPath: await _copy('assets/best_2_int8.tflite'),
    metadataPath: await _copy('assets/best_2_metadata.yaml'),
  );

  final objectDetector = ObjectDetector(model: model);
  await objectDetector.loadModel();
  var res = await objectDetector.detect(imagePath: image.path);
  //
  for (final detectedObject in res!) {
    if (detectedObject != null && detectedObject.confidence >= 0.8) {
      // print(detectedObject.label);
      // print(detectedObject.confidence);
      return detectedObject.label;
    }
  }
  // print(res.toString());
  return "null";
}

Future<String> _copy(String assetPath) async {
  final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
  await io.Directory(dirname(path)).create(recursive: true);
  final file = io.File(path);
  if (!await file.exists()) {
    final byteData = await rootBundle.load(assetPath);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }
  return file.path;
}