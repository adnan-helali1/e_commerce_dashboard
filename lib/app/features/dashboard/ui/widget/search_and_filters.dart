
import 'package:flutter/material.dart';
import 'filter_button.dart';

class SearchAndFilters extends StatelessWidget {
  final TextEditingController searchController;
  final String? selectedFilter;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onFilterChanged;
  final bool showFilters;

  const SearchAndFilters({
    super.key,
    required this.searchController,
    required this.selectedFilter,
    required this.onSearchChanged,
    required this.onFilterChanged,
    this.showFilters = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: "Search offers...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        if (showFilters) ...[
          const SizedBox(width: 16),

          FilterButton(
            title: "All",
            isSelected: selectedFilter == "All",
            onTap: () => onFilterChanged("All"),
          ),

          const SizedBox(width: 8),

          FilterButton(
            title: "Available",
            isSelected: selectedFilter == "Available",
            onTap: () => onFilterChanged("Available"),
          ),

          const SizedBox(width: 8),

          FilterButton(
            title: "Unavailable",
            isSelected: selectedFilter == "Unavailable",
            onTap: () => onFilterChanged("Unavailable"),
          ),
        ],
      ],
    );
  }
}