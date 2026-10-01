import 'package:flutter/material.dart';
import 'package:kuis/models/data.dart';
import 'package:kuis/views/detail.dart';

import '../controllers/menucontroller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppMenuController controller;

  @override
  void initState() {
    super.initState();
    controller = AppMenuController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final filteredCatalog = controller.filteredCatalog;

        return Scaffold(
          appBar: AppBar(title: const Text('Home Page')),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  onChanged: controller.setSearch,
                  decoration: InputDecoration(
                    hintText: 'Search menu',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    final isSelected = controller.selectedCategory == category;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (_) => controller.setCategory(category),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredCatalog.length,
                  itemBuilder: (context, index) {
                    final catalog = filteredCatalog[index];
                    final isFavorite = controller.isFavorite(catalog.id);

                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(catalog: catalog),
                          ),
                        );
                      },
                      title: Text(catalog.productName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(catalog.price),
                          Text(catalog.type),
                          Text("Stock: ${catalog.stock}"),
                          Text("Suka: ${catalog.likeCount}"),
                        ],
                      ),
                      leading: Image.network(
                        catalog.imageUrl,
                        width: 90,
                        height: 90,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () =>
                                controller.toggleFavorite(catalog.id),
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
