import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../refrige_detail/data/mock_repository/refrige_repository.dart';
import '../../refrige_detail/data/models/refrige_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> fridges = [];
  List<RefrigeDetail> refrigeItems = [];

  @override
  void initState() {
    final refrigeItems = RegisterdRefrigeRepository().getRefrigeDetail();
    for (int i = 1; i <= refrigeItems.length; i++) {
      fridges.add(makeFridge(i));
    }

    super.initState();
  }

  Widget makeFridge(int index) {
    return GestureDetector(
      onTap: () => context.go('/details', extra: refrigeItems[index - 1]),
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            refrigeItems[index - 1].refrigeName,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('공용 냉장고'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: 4 / 6),
          itemCount: fridges.length + 1,
          itemBuilder: (context, index) {
            if (index == fridges.length) {
              // Last item is the add button
              return IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  fridges.add(makeFridge(index + 1));
                  setState(() {});
                },
              );
            } else {
              // Display the fridge container
              return fridges[index];
            }
          },
        ),
      ),
    );
  }
}
