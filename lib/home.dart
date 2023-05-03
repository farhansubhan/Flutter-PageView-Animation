import 'package:flutter/material.dart';
import 'package:sepatu/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late ValueNotifier<double> _pageValue;

  List<String> gambarSepatu = [
    'sepatu1',
    'sepatu2',
    'sepatu3',
    'sepatu4'
  ];

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 1, initialPage: 0);
    _pageController.addListener(_pageListener);
    _pageValue = ValueNotifier(0.0);
    super.initState();
  }

  void _pageListener() {
    _pageValue.value = _pageController.page!;
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    _pageValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: gambarSepatu.length,
        controller: _pageController,
        itemBuilder: (context, index) {
          final board = gambarSepatu[index];
          return ValueListenableBuilder(
            valueListenable: _pageValue,
            builder: (context, value, child) {
              final delta = (value - index).abs();
              return ItemSlide(
                gambar: board,
                delta: delta
              );
            },
          );
        },
      ),
    );
  }
}