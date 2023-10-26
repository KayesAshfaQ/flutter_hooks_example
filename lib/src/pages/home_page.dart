import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_example/src/hooks/scrollcontroller_for_animation.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _hideFabAnimController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      initialValue: 1,
    );

    final _scrollController =
        useScrollControllerForAnimation(_hideFabAnimController);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Hooks Home Page'),
      ),
      body: ListView(
        controller: _scrollController,
        children: <Widget>[
          for (int i = 0; i < 5; i++)
            const Card(child: FittedBox(child: FlutterLogo())),
        ],
      ),
      floatingActionButton: FadeTransition(
        opacity: _hideFabAnimController,
        child: ScaleTransition(
          scale: _hideFabAnimController,
          child: FloatingActionButton.extended(
            label: const Text('Useless Floating Action Button'),
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}
