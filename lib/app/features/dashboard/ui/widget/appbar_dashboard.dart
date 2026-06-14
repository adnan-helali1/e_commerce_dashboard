 import 'package:flutter/material.dart';
 class AppbarDashboard extends StatelessWidget {
  AppbarDashboard();
   @override
  Widget build(BuildContext context) {
        return  Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xffE5E7EB)),
                    ),
                  ),
                  child: Row(children: [
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "B2B Smart Ordering Platform",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Welcome, SuperMart Downtown",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.phone_android),
                        label: const Text("Store App"),
                      ),

                      const SizedBox(width: 12),

                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.monitor),
                        label: const Text("Admin"),
                      ),
                    ],
                  ),
                );
         }}