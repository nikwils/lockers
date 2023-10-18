import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lockers/data/models/locker_model.dart';
import 'package:lockers/data/providers/providers.dart';
import 'package:lockers/services/imgs/imgs_controller_service.dart';
import 'package:lockers/services/theme/theme_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LockersWidget extends ConsumerWidget {
  const LockersWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(lockersProvider);

    return data.when(
      data: (data) {
        final lockers = data.lockers;
        return Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My lockers',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Icon(
                          Icons.exit_to_app,
                          color: ThemeManager.mainColor,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    LockersList(lockers: lockers),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        backgroundColor: ThemeManager.mainColor,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 14,
                          ),
                          Text('Add locker')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return RefreshIndicator(
          onRefresh: () => ref.read(lockersProvider.notifier).fetchData(),
          child: Stack(
            children: <Widget>[
              ListView(),
              const Center(
                child: Text('Error. Refresh the page'),
              )
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class LockersList extends ConsumerStatefulWidget {
  final List<LockerModel> lockers;
  const LockersList({super.key, required this.lockers});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LockersListState();
}

class _LockersListState extends ConsumerState<LockersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final locker = widget.lockers[index];
        bool lockedBool = locker.isLock;
        final colorLocked = lockedBool ? ThemeManager.mainColor : ThemeManager.unlockedColor;
        return Container(
          decoration:
              BoxDecoration(color: ThemeManager.backgroundColor, borderRadius: BorderRadius.circular(25)),
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: colorLocked),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  ImgsControllerService.lockIcon.url(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              locker.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'id: ${locker.id}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: colorLocked,
                  ),
                  child: Text(
                    lockedBool ? 'LOCKED' : 'UNLOCKED',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              )
            ]),
            trailing: CupertinoSwitch(
                value: lockedBool,
                onChanged: (bool value) {
                  lockedBool = value;
                }),
          ),
        );
      },
      itemCount: widget.lockers.length,
    );
  }
}
