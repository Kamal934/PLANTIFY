import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<Map<String, dynamic>> predictImage(File? imageFile) async {
 var request = http.MultipartRequest(
      'POST', Uri.parse('https://kml1-cropdisease.hf.space/predict'));
  request.files.add(http.MultipartFile.fromBytes(
      'file', imageFile!.readAsBytesSync(),
      filename: imageFile.path));
  var response = await request.send();
  var responseData = await response.stream.bytesToString();
  // print(responseData);
  return jsonDecode(responseData);
}
