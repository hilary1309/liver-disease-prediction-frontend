import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ldp_prediction/core/provider/user_provider.dart';
import 'package:ldp_prediction/features/home/home_screen.dart';
import 'package:ldp_prediction/features/info/info_screen.dart';
import 'package:ldp_prediction/features/upload/upload_image_screen.dart';
import 'package:provider/provider.dart';

class BottomNavComponent extends StatefulWidget {
  const BottomNavComponent({super.key});

  @override
  State<BottomNavComponent> createState() => _BottomNavComponentState();
}

class _BottomNavComponentState extends State<BottomNavComponent> {
  final List<Widget> _views = [
    const HomeScreen(),
    const UploadImageScreen(),
    const InfoScreen(),
    Container()
    // TestAnalyticsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: _views.elementAt(userProvider.selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 0,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        unselectedLabelStyle: TextStyle(
            color: Colors.grey.withOpacity(.5), fontWeight: FontWeight.w500),
        selectedLabelStyle:
            const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
        currentIndex: userProvider.selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 222, 33, 243),
        unselectedItemColor: const Color.fromARGB(255, 2, 2, 2).withOpacity(.5),
        onTap: (index) {
          userProvider.updateSelectedIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 16,
                    width: 16,
                    child: userProvider.selectedIndex == 0
                        ? const Icon(Icons.home)
                        : const Icon(Icons.home))),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(height: 16, width: 16, child: Icon(Icons.upload)),
            ),
            label: 'Upload',
          ),
          const BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(height: 16, width: 16, child: Icon(Icons.info)),
            ),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}
