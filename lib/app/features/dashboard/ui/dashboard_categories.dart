import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/admin_panel.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/appbar_dashboard.dart';
import 'package:e_commerce_dashboard/app/features/dashboard/ui/widget/header.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final String description;
  final int products;
  final Color statusColor;

  CategoryModel({
    required this.title,
    required this.description,
    required this.products,
    required this.statusColor,
  });
}

class Categories extends StatelessWidget {
  Categories({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(
      title: "Dairy",
      description: "Milk, cheese, yogurt products",
      products: 45,
      statusColor: Colors.blue,
    ),
    CategoryModel(
      title: "Bakery",
      description: "Bread, pastries, baked goods",
      products: 32,
      statusColor: Colors.green,
    ),
    CategoryModel(
      title: "Beverages",
      description: "Soft drinks and juices",
      products: 28,
      statusColor: Colors.orange,
    ),
    CategoryModel(
      title: "Snacks",
      description: "Chips, biscuits and candy",
      products: 15,
      statusColor: Colors.red,
    ),
    CategoryModel(
      title: "Frozen Food",
      description: "Frozen products",
      products: 11,
      statusColor: Colors.purple,
    ),
    CategoryModel(
      title: "Vegetables",
      description: "Fresh vegetables",
      products: 52,
      statusColor: Colors.teal,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Row(
        children: [
          AdminPanel(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarDashboard(),
                SizedBox(height: 60),
                Header(title: "Categories Management",
                 subtitle: "Organize products into categories",
                 showAddButton: true,buttonText: "Add Categories",
                 onAddPressed: () {
                   
                 },),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20),
                    itemCount: (categories.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      final first = categories[index * 2];
                  
                      final CategoryModel? second =
                          (index * 2 + 1 < categories.length)
                              ? categories[index * 2 + 1]
                              : null;
                  
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: CategoryCard(category: first),
                            ),
                  
                            const SizedBox(width: 20),
                  
                            Expanded(
                              child: second != null
                                  ? CategoryCard(category: second)
                                  : const SizedBox(),
                            ),
                          ],
                        ),
                      );
                    },
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

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // IMAGE
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(22),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.folder_open_rounded,
                size: 70,
                color: Colors.grey.shade400,
              ),
            ),
          ),
           Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          category.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: category.statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    category.description,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "Products",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    category.products.toString(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff00A3FF),
                    ),
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit_outlined,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red.shade200,
                          ),
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}