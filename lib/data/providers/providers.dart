import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lockers/data/models/general_model.dart';
import 'package:lockers/view/lockers/lockers_provider.dart';

final lockersProvider = StateNotifierProvider.autoDispose<LockersProvider, AsyncValue<GeneralModel>>((ref) {
  return LockersProvider();
});
