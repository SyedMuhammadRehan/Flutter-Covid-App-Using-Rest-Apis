import 'dart:convert';

import 'package:coronavirus_app/Modal/world_countries_modal.dart';
import 'package:coronavirus_app/Services/Utilities/app_url.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  List<WorldCountriesModal> countrieslist = [];
  Future<List<WorldCountriesModal>> getcountriesdata() async {
    final response = await http.get(Uri.parse(AppUrl.countrieslist));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        countrieslist.add(WorldCountriesModal.fromJson(i));
      }
      return countrieslist;
    } else {
      return countrieslist;
    }
  }
}

final states_provider = Provider<StatesServices>((ref) {
  return StatesServices();
});
