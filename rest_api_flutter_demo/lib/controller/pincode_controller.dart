import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_flutter_demo/model/pincode.dart';

class PincodeController {
  Future<List<Pincode>> getAreaByPincode(String pincode) async {
    var url = 'https://api.postalpincode.in/pincode/$pincode';
    List<Pincode> id = [];
    try {
      var response = await http.get(
        Uri.parse(url),
      );
      id = List<Pincode>.from(
          json.decode(response.body).map((x) => Pincode.fromJson(x)));
      print('data-----${id.first.message}');
    } catch (e) {
      print('err-$e');
    }
    return id;
  }
}
