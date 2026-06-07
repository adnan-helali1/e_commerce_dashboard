import 'package:e_commerce_dashboard/app/core/helpers/spacing.dart';

import 'package:flutter/material.dart';
class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
   bool isOpen=true;
  int selectedIndex = 0;

  final List<String> menuTitles = [
    "Dashboard",
    "Suppliers",
    "Categories",
    "Master Products",
    "Supplier Products",
    "Orders",
    "Sales",
    "Reports",
    "Settings",
  ];

  final List<IconData> menuIcons = [
    Icons.home_outlined,
    Icons.people_outline,
    Icons.menu_book_outlined,
    Icons.inventory_2_outlined,
    Icons.shopping_cart_outlined,
    Icons.shopping_bag_outlined,
    Icons.show_chart,
    Icons.description_outlined,
    Icons.settings_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return 
          /// SIDEBAR
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
  width: isOpen ? 280 : 90,
           
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// TITLE
               Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

    if (isOpen)
      const Text(
        "Admin Panel",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),

    IconButton(
      onPressed: () {

        setState(() {
          isOpen = !isOpen;
        });

      },

      icon: Icon(
        isOpen
            ? Icons.chevron_left
            : Icons.menu,
        size: 30,
      ),
    ),
  ],
),
                SizedBox(height: 10,),

                /// MENU
                Expanded(
                  child: ListView.builder(
                    itemCount: menuTitles.length,
                    itemBuilder: (context, index) {

                      bool isSelected = selectedIndex == index;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),

                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },

                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),

                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xff1E1B4B)
                                  : Colors.transparent,

                              borderRadius: BorderRadius.circular(14),
                            ),

                            child: Row(
                              children: [

                                Icon(
                                  menuIcons[index],
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,
                                ),

                                if (isOpen)
                                const SizedBox(width: 15),
                                if (isOpen)
                                 Text(
                                  menuTitles[index],
                                  style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                         ),
                                  ),
                            
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
         
    );
  }
}