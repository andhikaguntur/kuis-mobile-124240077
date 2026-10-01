import 'package:flutter/material.dart';
import 'package:kuis/models/data.dart';

class DetailPage extends StatelessWidget {
  final Product catalog;

  const DetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F2EE),
      appBar: AppBar(
        title: Text(catalog.productName),
        backgroundColor: const Color(0xFFF5F2EE),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  width: double.infinity,
                  height: 260,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Image.network(
                    catalog.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 260,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              catalog.productName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F1F1F),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              catalog.type,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF7D7D7D),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              catalog.price,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2DAE5E),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Jumlah Produk",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F1F1F),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Ukuran",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F1F1F),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Deskripsi",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F1F1F),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              catalog.details,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Color(0xFF4E4E4E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
