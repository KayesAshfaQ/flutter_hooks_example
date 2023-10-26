import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  // @override
  // void initState() {
  //   _scrollController = ScrollController();
  //   _hideFabAnimController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(milliseconds: 300),
  //     value: 1,
  //   );

  //   _scrollController.addListener(() {
  //     switch (_scrollController.position.userScrollDirection) {
  //       // Scrolling up - forward the animation (value goes to 1)
  //       case ScrollDirection.forward:
  //         _hideFabAnimController.forward();
  //         break;
  //       // Scrolling down - reverse the animation (value goes to 0)
  //       case ScrollDirection.reverse:
  //         _hideFabAnimController.reverse();
  //         break;
  //       // Idle - keep FAB visibility unchanged
  //       case ScrollDirection.idle:
  //         break;
  //     }
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final _hideFabAnimController = useAnimationController(
      duration: const Duration(milliseconds: 300),
      initialValue: 1,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Hooks Home Page'),
      ),
      body: ListView(
        //controller: _scrollController,
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

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   _hideFabAnimController.dispose();
  //   super.dispose();
  // }
}
