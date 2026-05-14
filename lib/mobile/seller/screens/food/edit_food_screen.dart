import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/data/models.dart';

class EditFoodScreen extends StatefulWidget {
  final SellerFood food;
  const EditFoodScreen({super.key, required this.food});
  @override
  State<EditFoodScreen> createState() => _EditFoodScreenState();
}

class _EditFoodScreenState extends State<EditFoodScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _portionsController;
  late String _selectedCategory;
  late String _selectedStatus;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.food.name);
    _descController = TextEditingController(text: widget.food.description);
    _portionsController = TextEditingController(
      text: '${widget.food.totalPortions}',
    );
    _selectedCategory = widget.food.category;
    _selectedStatus = widget.food.status.name;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _portionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Edit Makanan'),
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.food.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 200,
                  color: AppColors.shimmerBase,
                  child: const Center(
                    child: Icon(
                      Icons.image,
                      size: 48,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_rounded, size: 18),
                label: const Text('Ganti Foto'),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Nama Makanan',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(controller: _nameController),
            const SizedBox(height: 20),

            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(controller: _descController, maxLines: 3),
            const SizedBox(height: 20),

            const Text(
              'Kategori',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedCategory,
              items: [
                'Nasi',
                'Roti & Kue',
                'Sayuran',
                'Buah',
                'Minuman',
                'Snack',
                'Lauk Pauk',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _selectedCategory = v!),
            ),
            const SizedBox(height: 20),

            const Text(
              'Jumlah Porsi',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _portionsController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            const Text(
              'Status',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedStatus,
              items: ['active', 'soldOut', 'expired', 'draft']
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(switch (e) {
                        'active' => 'Aktif',
                        'soldOut' => 'Habis',
                        'expired' => 'Expired',
                        'draft' => 'Draft',
                        _ => e,
                      }),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _selectedStatus = v!),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Simpan Perubahan'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.error,
                  side: const BorderSide(color: AppColors.error),
                ),
                child: const Text('Hapus Makanan'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
