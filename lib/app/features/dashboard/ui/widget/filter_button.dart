import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String? title;
  final bool? isSelected;
  final VoidCallback? onTap;

  const FilterButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
@override
Widget build(BuildContext context) {
  if (title == null || isSelected == null) {
    return const SizedBox.shrink();
  }

  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: isSelected!
            ? const Color(0xff283593)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title!,
        style: TextStyle(
          color: isSelected!
              ? Colors.white
              : Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
 
}