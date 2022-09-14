import 'dart:convert';

import 'package:coronavirus_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../Modal/world_states_modal.dart';

class StatesServices {
  Future<WorldStatesModal> getdata() async {
    final response = await http.get(Uri.parse(AppUrl.worldstatesapi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStatesModal.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
