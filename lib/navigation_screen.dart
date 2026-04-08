import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/presentation/home.dart';
import 'gen/colors.gen.dart';
import 'helpers/helper_methods.dart';

class NavigationScreen extends StatefulWidget {
  final Widget? pageNum;
  const NavigationScreen({
    super.key,
    this.pageNum,
  });

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  final bool _isFisrtBuild = true;

  final List<Widget> _screens = [
    const HomeScreen(),
    const _PlaceholderScreen(label: 'Schedule'),
    const _PlaceholderScreen(label: 'Cart'),
    const _PlaceholderScreen(label: 'Favorites'),
    const _PlaceholderScreen(label: 'Profile'),
  ];

  static const List<IconData> _navIcons = [
    Icons.home,
    Icons.calendar_month,
    Icons.shopping_cart,
    Icons.favorite_border,
    Icons.person_outline,
  ];

  static const List<String> _navLabels = [
    'Home',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    Object? args;
    Widget? screenPage;

    if (_isFisrtBuild) {
      args = ModalRoute.of(context)?.settings.arguments;
    }

    if (args != null && args is Widget) {
      screenPage = args;
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) async {
        showMaterialDialog(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: Center(
          child: screenPage ?? _screens.elementAt(_currentIndex),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
          child: Container(
            height: 76.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  final selected = index == _currentIndex;
                  final iconColor = selected ? Colors.white : const Color(0xFF5A5A5A);
                  final backgroundColor = selected ? AppColors.primaryColor : Colors.white;
                  final borderColor = const Color.fromARGB(0, 11, 101, 81);

                  return Expanded(
                    child: index == 0
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                              child: Container(
                                height: 52.h,
                                padding: EdgeInsets.symmetric(horizontal: 18.w),
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(28.r),
                                  border: Border.all(color: borderColor, width: 1.5),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(_navIcons[index], color: iconColor, size: 24.sp),
                                    SizedBox(width: 10.w),
                                    Text(
                                      _navLabels[index],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: iconColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            child: Container(
                              width: 44.w,
                              height: 44.w,
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(color: borderColor, width: 1.5),
                              ),
                              child: Icon(
                                _navIcons[index],
                                color: iconColor,
                                size: 24.sp,
                              ),
                            ),
                          ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(label, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
