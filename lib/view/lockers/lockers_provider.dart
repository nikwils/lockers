import 'package:lockers/data/models/general_model.dart';
import 'package:lockers/services/api/api_controller_service.dart';
import 'package:lockers/services/api/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LockersProvider extends StateNotifier<AsyncValue<GeneralModel>> {
  LockersProvider()
      : super(AsyncValue.data(GeneralModel(profile: [], posts: [], comments: [], lockers: []))) {
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      state = const AsyncValue.loading();
      final response = await ApiService().get(controller: ApiControllerService.db);

      if (response == null) return;

      if (response.statusCode == 200) {
        final data = GeneralModel.fromJson(response.body);

        state = AsyncValue.data(data);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
