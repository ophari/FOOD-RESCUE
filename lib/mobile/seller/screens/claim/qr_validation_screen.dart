import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class QrValidationScreen extends StatefulWidget {
  const QrValidationScreen({super.key});
  @override
  State<QrValidationScreen> createState() => _QrValidationScreenState();
}

class _QrValidationScreenState extends State<QrValidationScreen> {
  bool _isScanning = true;
  bool? _isValid;

  void _simulateScan(bool valid) {
    setState(() {
      _isScanning = false;
      _isValid = valid;
    });
  }

  void _resetScan() {
    setState(() {
      _isScanning = true;
      _isValid = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Scan QR Code',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _isScanning ? _buildScanner() : _buildResult(),
    );
  }

  Widget _buildScanner() {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(color: Colors.black),
              // Scanner overlay
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.primary, width: 3),
                ),
                child: Stack(
                  children: [
                    // Corner markers
                    ...[
                      Alignment.topLeft,
                      Alignment.topRight,
                      Alignment.bottomLeft,
                      Alignment.bottomRight,
                    ].map(
                      (align) => Align(
                        alignment: align,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border(
                              top:
                                  align == Alignment.topLeft ||
                                      align == Alignment.topRight
                                  ? const BorderSide(
                                      color: AppColors.primary,
                                      width: 4,
                                    )
                                  : BorderSide.none,
                              bottom:
                                  align == Alignment.bottomLeft ||
                                      align == Alignment.bottomRight
                                  ? const BorderSide(
                                      color: AppColors.primary,
                                      width: 4,
                                    )
                                  : BorderSide.none,
                              left:
                                  align == Alignment.topLeft ||
                                      align == Alignment.bottomLeft
                                  ? const BorderSide(
                                      color: AppColors.primary,
                                      width: 4,
                                    )
                                  : BorderSide.none,
                              right:
                                  align == Alignment.topRight ||
                                      align == Alignment.bottomRight
                                  ? const BorderSide(
                                      color: AppColors.primary,
                                      width: 4,
                                    )
                                  : BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                child: const Text(
                  'Arahkan kamera ke QR Code pembeli',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        // Demo buttons
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Demo: Simulasi Scan',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () => _simulateScan(true),
                          child: const Text('Valid'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () => _simulateScan(false),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.error,
                            side: const BorderSide(color: AppColors.error),
                          ),
                          child: const Text('Invalid'),
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
    );
  }

  Widget _buildResult() {
    final valid = _isValid == true;
    return Container(
      color: AppColors.background,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: valid
                      ? AppColors.success.withValues(alpha: 0.1)
                      : AppColors.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  valid ? Icons.check_circle_rounded : Icons.cancel_rounded,
                  size: 72,
                  color: valid ? AppColors.success : AppColors.error,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                valid ? 'QR Code Valid!' : 'QR Code Tidak Valid',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: valid ? AppColors.success : AppColors.error,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                valid
                    ? 'Pickup dikonfirmasi. Makanan siap diserahkan ke pembeli.'
                    : 'QR Code tidak ditemukan atau sudah digunakan.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              if (valid) ...[
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pembeli',
                            style: TextStyle(
                              color: AppColors.textTertiary,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'Ahmad Rizki',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Makanan',
                            style: TextStyle(
                              color: AppColors.textTertiary,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'Nasi Gudeg Komplit',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Porsi',
                            style: TextStyle(
                              color: AppColors.textTertiary,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            '2 porsi',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kode',
                            style: TextStyle(
                              color: AppColors.textTertiary,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'SISA-2024-001',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: valid ? () => Navigator.pop(context) : _resetScan,
                  child: Text(valid ? 'Selesai' : 'Scan Ulang'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
