
import 'package:http/http.dart' as http;
import 'dart:io';

Future<String> get_image_class(File imageFile) async {
  var request = http.MultipartRequest('POST', Uri.parse('https://mini-project-3-flask-api.onrender.com/predict'));

  var image = await http.MultipartFile.fromPath('', imageFile.path);
  request.files.add(image);

  var streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);
  if (response.statusCode == 200) {
    print('Image uploaded successfully');
    print(response.body);
    return response.body;
  } else {
    print('Failed to upload image. Status code: ${response.statusCode}');
  }
  return "-1";
}
