enum ImgsControllerService {
  logo,
  lockIcon,
  friendsBottomNavigation,
  settingsBottomNavigation,
}

extension ImgsControllerServiceExtension on ImgsControllerService {
  String url([String format = 'svg']) {
    final resolution = format;
    switch (this) {
      case ImgsControllerService.logo:
        return 'assets/images/logo.$resolution';
      case ImgsControllerService.lockIcon:
        return 'assets/images/lock_icon.$resolution';
      case ImgsControllerService.friendsBottomNavigation:
        return 'assets/images/friends_bottom_navigation.$resolution';
      case ImgsControllerService.settingsBottomNavigation:
        return 'assets/images/settings_bottom_navigation.$resolution';
    }
  }
}
