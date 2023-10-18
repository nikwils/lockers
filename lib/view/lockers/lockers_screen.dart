import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lockers/services/imgs/imgs_controller_service.dart';
import 'package:lockers/services/theme/theme_manager.dart';
import 'package:lockers/view/lockers/widgets/lockers_widget.dart';
import 'package:lockers/view/lockers/widgets/other_widget.dart';

class LockersScreen extends StatefulWidget {
  const LockersScreen({super.key});

  @override
  State<LockersScreen> createState() => _LockersScreenState();
}

class _LockersScreenState extends State<LockersScreen> {
  int _currentIndex = 0;

  List<Widget> body = [
    const LockersWidget(),
    OtherWidget(assetName: ImgsControllerService.friendsBottomNavigation.url()),
    OtherWidget(assetName: ImgsControllerService.settingsBottomNavigation.url()),
  ];

  createBottomNavigation({
    required String assetName,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        assetName,
        colorFilter: const ColorFilter.mode(ThemeManager.inactiveColor, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        assetName,
        colorFilter: const ColorFilter.mode(ThemeManager.mainColor, BlendMode.srcIn),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          createBottomNavigation(assetName: ImgsControllerService.logo.url(), label: 'My lockers'),
          createBottomNavigation(
              assetName: ImgsControllerService.friendsBottomNavigation.url(), label: 'My friends'),
          createBottomNavigation(
              assetName: ImgsControllerService.settingsBottomNavigation.url(), label: 'Profile'),
        ],
      ),
      appBar: AppBar(
        title: Wrap(
          spacing: 5,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SvgPicture.asset(
              ImgsControllerService.logo.url(),
              fit: BoxFit.cover,
              width: 20,
              height: 20,
            ),
            Text(
              'ALILOCK',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
      body: body[_currentIndex],
    );
  }
}
