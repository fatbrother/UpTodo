import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list_sample/utility/pages.dart';
import 'package:todo_list_sample/utility/user.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final ScrollController _scrollController = ScrollController();
  int index = 0;

  List<Image> images = [
    Image.asset('assets/images/welcome1.png', height: 300),
    Image.asset('assets/images/welcome2.png', height: 300),
    Image.asset('assets/images/welcome3.png', height: 300),
  ];

  List<String> titles = [
    'Manage your tasks',
    'Create daily routine',
    'Orgonaize your tasks',
  ];

  List<String> descriptions = [
    'You can easily manage all of your daily tasks in DoMe for free',
    'In Uptodo  you can create your personalized routine to stay productive',
    'You can organize your daily tasks by adding your tasks into separate categories',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 58),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: _onGetStarted,
                      child: Text(
                        'SKIP',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        controller: _scrollController,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: images
                            .map((e) => SizedBox(
                                  width: MediaQuery.of(context).size.width - 24,
                                  child: Center(child: e),
                                ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Container(
                              color: index == i
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onBackground,
                              height: 4,
                              width: 30,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Text(
                        titles[index],
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Text(
                        descriptions[index],
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 16,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                index == 0
                    ? const SizedBox()
                    : TextButton(
                        onPressed: _onBack,
                        child: Text(
                          'BACK',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                      ),
                ElevatedButton(
                  onPressed: index == 2 ? _onGetStarted : _onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    index == 2 ? 'GET STARTED' : 'NEXT',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onNext() {
    setState(() {
      index = min(index + 1, 2);
      _scrollController.animateTo(
        (MediaQuery.of(context).size.width - 24) * index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  void _onBack() {
    setState(() {
      index = max(index - 1, 0);
      _scrollController.animateTo(
        (MediaQuery.of(context).size.width - 24) * index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  void _onGetStarted() {
    User().isFirstTime = false;
    Navigator.of(context).pushNamed(Pages.index);
  }
}
