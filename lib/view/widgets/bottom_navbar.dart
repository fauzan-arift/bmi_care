import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int currentPage;
  final bool isKeyboardVisible;
  final Function(int) onPageSelected;

  const BottomNavbar({
    super.key,
    required this.currentPage,
    required this.isKeyboardVisible,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return isKeyboardVisible
        ? SizedBox.shrink()
        : Container(
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            color: Color(0xFFEFF2F0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => onPageSelected(0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home,
                        size: 30,
                        color: currentPage == 0
                            ? Color(0xFF0074D9)
                            : Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 14,
                          color: currentPage == 0
                              ? Color(0xFF0074D9)
                              : Colors.grey,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => onPageSelected(1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.info,
                        size: 30,
                        color: currentPage == 1
                            ? Color(0xFF0074D9)
                            : Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Info',
                        style: TextStyle(
                          fontSize: 14,
                          color: currentPage == 1
                              ? Color(0xFF0074D9)
                              : Colors.grey,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
