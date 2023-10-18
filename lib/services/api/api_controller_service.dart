enum ApiControllerService {
  db,
}

extension ControllerServiceExtension on ApiControllerService {
  String url() => switch (this) {
        ApiControllerService.db => 'db',
      };
}
