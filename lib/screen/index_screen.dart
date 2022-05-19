import 'package:bottom_navigation_view/bottom_navigation_view.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen>
    with SingleTickerProviderStateMixin {
  late final BottomNavigationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = BottomNavigationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigationView(
          controller: _controller,
          transitionType: BottomNavigationTransitionType.none,
          children: const [
            ColorScreen(color: Colors.red, name: 'Chats'),
            ColorScreen(color: Colors.blue, name: 'Calls'),
            ColorScreen(color: Colors.yellow, name: 'People'),
            ColorScreen(color: Colors.green, name: 'Stories'),
          ]),
      bottomNavigationBar: BottomNavigationIndexedBuilder(
          controller: _controller,
          builder: (context, index, child) {
            return BottomNavigationBar(
                currentIndex: index,
                onTap: (index) {
                  _controller.goTo(index);
                },
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(label: 'Chats', icon: Icon(Icons.chat_bubble_outlined)),
                  BottomNavigationBarItem(
                      label: 'Calls', icon: Icon(Icons.videocam)),
                  BottomNavigationBarItem(
                      label: 'People', icon: Icon(Icons.people_alt)),
                  BottomNavigationBarItem(
                      label: 'Stories', icon: Icon(Icons.amp_stories_sharp)),
                ]);
          }),
    );
  }
}

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key, required this.color, required this.name})
      : super(key: key);

  final Color color;
  final String name;

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: widget.color,
      child: Text(widget.name),
    );
  }
}
