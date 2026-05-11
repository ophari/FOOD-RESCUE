# Dokumentasi Developer - SISA 1 (Food Rescue Platform)

**SISA 1**. Saat ini proyek baru menyelesaikan tahap **UI/UX (Frontend Only)** menggunakan *dummy data*. Sistem backend dan API integrasi belum dibuat.

## 1. Arsitektur Proyek

```text
lib/
├── core/         # Konfigurasi utama aplikasi (Tema, Konstanta, Routing)
├── data/         # Model data dan dummy data
├── screens/      # Halaman-halaman UI berdasarkan fitur
├── widgets/      # Komponen UI modular (Reusable Widgets)
└── main.dart     # Entry point aplikasi
```

### Detail Folder:
- **`core/theme/`**: Menyimpan warna utama aplikasi (`app_colors.dart`) dan konfigurasi tema Material 3 (`app_theme.dart`). Jangan hardcode warna di dalam UI, gunakan file ini.
- **`core/constants/`**: Tempat untuk konstanta global seperti path nama aset (gambar, ikon) dan string statis (`app_constants.dart`).
- **`core/router/`**: Konfigurasi navigasi menggunakan `go_router` (`app_router.dart`). Semua perpindahan rute harus didaftarkan di sini.
- **`data/`**: Struktur blueprint data (`models.dart`) seperti `FoodItem`, `ClaimItem`, `User`, beserta data statis sementara (`dummy/dummy_data.dart`).
- **`screens/`**: Berisi halaman/layar utama aplikasi yang dikelompokkan dalam sub-folder (auth, home, explore, claim, profile, dll).
- **`widgets/`**: Komponen independen yang sering dipakai berulang seperti `FoodCard`, text field khusus, dan kerangka bottom navigation bar (`main_scaffold.dart`).

---

## 2. Package Utama yang Digunakan

Proyek ini telah dikonfigurasi menggunakan package-package modern. Jika ada error saat dijalankan pertama kali, jalankan perintah `flutter pub get`.

- **Navigasi & Routing**: `go_router` (Navigasi deklaratif berbasis path URL).
- **Desain & UI**: 
  - `google_fonts`: Untuk merender font Inter / Poppins tanpa perlu mendownload file `.ttf` secara manual.
  - `flutter_svg`: Untuk menampilkan ikon berbasis vektor (`.svg`).
  - `cached_network_image`: Untuk memuat gambar makanan dari URL dengan sistem memori/disk cache.
  - `smooth_page_indicator`: Untuk indikator titik halaman onboarding.
- **Animasi & Efek**: 
  - `flutter_animate`: Memberikan animasi masuk (fade, slide) dan interaksi mikro yang halus.
  - `shimmer`: Memberikan efek *loading skeleton* (abu-abu berjalan) saat data seolah-olah sedang dimuat.
- **Fitur Spesifik**: 
  - `qr_flutter`: Untuk menampilkan kode QR saat makanan berhasil diklaim.
  - `flutter_map` & `latlong2`: Untuk merender peta open-source dan sistem koordinat jarak (menggantikan Google Maps native).

---

## 3. Alur Penggunaan Aplikasi (User Flow)

1. **Splash Screen**: Menampilkan logo SISA 1 dengan delay otomatis ke halaman selanjutnya.
2. **Onboarding**: Penjelasan fitur (swipe kanan) sebelum masuk halaman login.
3. **Authentication**: Halaman masuk dan daftar. (Saat ini menekan "Login" akan langsung memotong proses autentikasi sesungguhnya).
4. **Main Scaffold**: Halaman inti yang memiliki *Bottom Navigation Bar*.
   - **Home**: Beranda dengan rekomendasi makanan terdekat dan daftar kategori.
   - **Explore**: Layar eksplorasi menggunakan tampilan daftar atau tampilan *Map* interaktif.
   - **Claim**: Riwayat pengguna, dibagi menjadi tab "Aktif" (sedang di-booking) dan "Selesai".
   - **Notification**: Daftar pengingat (waktu pickup, dll).
   - **Profile**: Detail dan pengaturan akun.
5. **Detail Makanan & Checkout**: Alur saat pengguna menekan makanan -> Detail -> Konfirmasi Klaim -> Berhasil (Menampilkan QR Code).

---

## 4. Panduan Pengembangan Selanjutnya (Next Steps)


1. **Setup State Management**: 
   Aplikasi saat ini hanya berupa *Stateless* dan *Stateful Widgets*. Integrasikan *State Management* seperti `BLoC`, `Riverpod`, atau `Provider` untuk menyalurkan data.
2. **Hapus Dummy Data & Sambungkan API**: 
   Di dalam folder `lib/data/dummy/dummy_data.dart`, terdapat data tiruan. Buatlah lapisan repositori/service (misal: `lib/services/api_service.dart`) untuk mengambil data asli dari *server* menggunakan package `dio` atau `http`.
3. **Logika Autentikasi**: 
   Hubungkan inputan *username/password* di `screens/auth/` ke endpoint login. Simpan Token sesi menggunakan package `shared_preferences` atau `flutter_secure_storage`.
4. **Peta Dinamis**: 
   Ubah koordinat statis pada komponen `flutter_map` menjadi posisi GPS *real-time* perangkat menggunakan package `geolocator`.

---

## 5. Standar Penulisan Kode (Guidelines)

- **Penamaan**: Semua nama variabel, fungsi, dan class wajib menggunakan Bahasa Inggris (`camelCase` untuk variabel/fungsi, `PascalCase` untuk Class, dan `snake_case` untuk nama file).
- **Reusability**: Jika Anda menemukan susunan UI yang terdiri lebih dari 100 baris (contoh: *card* panjang atau modal), pisahkan menjadi file widget mandiri di `lib/widgets/`.
- **Clean UI Code**: Hindari warna / teks *hardcode* di dalam tree UI. Selalu gunakan `AppColors` dan simpan text aset di `AppConstants` atau implementasikan *Localization*.
