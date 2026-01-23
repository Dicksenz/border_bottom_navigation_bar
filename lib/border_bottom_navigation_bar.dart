import 'package:flutter/material.dart';

class BorderBottomNavigationBar extends StatelessWidget {
  final double height;
  final double borderRadiusValue;
  final List<BorderBottomNavigationItems> customBottomNavItems;
  final Color? backgroundColor;
  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final double selectedLabelFontSize;
  final double unselectedLabelFontSize;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final int currentIndex;
  final Function(int) onTap;

  const BorderBottomNavigationBar({
    super.key,
    this.height = 80,
    this.borderRadiusValue = 25,
    required this.customBottomNavItems,
    this.backgroundColor,
    required this.selectedBackgroundColor,
    required this.unselectedBackgroundColor,
    required this.selectedIconColor,
    required this.unselectedIconColor,
    this.currentIndex = 0,
    this.unselectedLabelFontSize = 12,
    this.selectedLabelFontSize = 12,
    this.selectedLabelColor = Colors.black,
    this.unselectedLabelColor = Colors.black,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Container(
          height: height,
          margin: const EdgeInsets.only(bottom: 20),
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: backgroundColor ?? unselectedBackgroundColor,
            borderRadius: BorderRadius.circular(borderRadiusValue),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(customBottomNavItems.length, (index) {
              return Expanded(
                child: BorderBottomNavigationButton(
                  onTap: onTap,
                  unselectedIconColor: unselectedIconColor,
                  selectedIconColor: selectedIconColor,
                  selectedLabelColor: selectedLabelColor,
                  unselectedLabelColor: unselectedLabelColor,
                  selectedBackgroundColor: selectedBackgroundColor,
                  icon: customBottomNavItems[index].icon,
                  label: customBottomNavItems[index].label,
                  index: index,
                  currentIndex: currentIndex,
                  selectedLabelFontSize: selectedLabelFontSize,
                  unselectedLabelFontSize: unselectedLabelFontSize,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class BorderBottomNavigationItems {
  final IconData icon;
  final String label;

  BorderBottomNavigationItems({
    required this.icon,
    required this.label,
  });
}

class BorderBottomNavigationButton extends StatelessWidget {
  final IconData icon;
  final Color selectedBackgroundColor;
  final String label;
  final double selectedLabelFontSize;
  final double unselectedLabelFontSize;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final Function(int) onTap;
  final int? currentIndex;
  final int index;

  const BorderBottomNavigationButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.currentIndex,
    required this.selectedBackgroundColor,
    required this.selectedLabelFontSize,
    required this.unselectedLabelFontSize,
    this.selectedLabelColor = Colors.black,
    this.unselectedLabelColor = Colors.black,
    required this.index,
    required this.label,
    required this.selectedIconColor,
    required this.unselectedIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 32,
            decoration: BoxDecoration(
              color: isSelected ? selectedBackgroundColor : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: isSelected ? selectedIconColor : unselectedIconColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? selectedLabelColor : unselectedLabelColor,
              fontSize:
                  isSelected ? selectedLabelFontSize : unselectedLabelFontSize,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
