import 'package:coronavirus_app/Modal/world_countries_modal.dart';
import 'package:coronavirus_app/Services/states_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Modal/world_states_modal.dart';

final dataProvider = FutureProvider<WorldStatesModal>((ref) async {
  return ref.watch(states_provider).getdata();
});
final countrydataProvider =
    FutureProvider<List<WorldCountriesModal>>((ref) async {
  return ref.watch(states_provider).getcountriesdata();
});
