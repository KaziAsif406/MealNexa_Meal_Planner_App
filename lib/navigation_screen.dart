import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_flutter/features/home/presentation/home.dart';
import 'package:template_flutter/gen/colors.gen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  static final List<_NavigationItem> _items = [
    _NavigationItem(icon: Icons.home_outlined, label: 'Home'),
    _NavigationItem(icon: Icons.calendar_month_outlined, label: 'Schedule'),
    _NavigationItem(icon: Icons.shopping_cart_outlined, label: 'Cart'),
    _NavigationItem(icon: Icons.favorite_border, label: 'Favorites'),
    _NavigationItem(icon: Icons.person_outline, label: 'Profile'),
  ];

  static final List<Widget> _pages = [
    const HomeScreen(),
    const _PlaceholderScreen(label: 'Schedule'),
    const _PlaceholderScreen(label: 'Cart'),
    const _PlaceholderScreen(label: 'Favorites'),
    const _PlaceholderScreen(label: 'Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 10.h,
        bottom: MediaQuery.of(context).padding.bottom + 10.h,
      ),
      child: Row(
        children: List.generate(_items.length, (index) {
          final item = _items[index];
          final selected = index == _selectedIndex;
          return Expanded(
            flex: selected ? 2 : 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutQuart,
                height: 52.h,
                decoration: BoxDecoration(
                  color: selected ? AppColors.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(999.r),
                    onTap: () => _onItemTapped(index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            item.icon,
                            size: 22.sp,
                            color: selected
                                ? AppColors.cFFFFFF
                                : const Color(0xFF8E8E93),
                          ),
                          if (selected) ...[
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                item.label,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.cFFFFFF,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavigationItem {
  final IconData icon;
  final String label;

  const _NavigationItem({required this.icon, required this.label});
}

class _PlaceholderScreen extends StatelessWidget {
  final String label;

  const _PlaceholderScreen({required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.c0A0A0A,
            ),
          ),
        ),
      ),
    );
  }
}
