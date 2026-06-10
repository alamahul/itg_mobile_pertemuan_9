# Product Catalog App

A Flutter mobile application for browsing products, viewing detailed information, and managing favorite items.

## Fitur Utama

1. Detail Page untuk setiap produk
   - Menampilkan informasi lengkap produk seperti judul, deskripsi, harga, dan gambar.
   - Tombol favorite di halaman detail untuk menambahkan atau menghapus produk dari daftar favorit.

2. Favorite count di HomePage
   - Ikon favorit di AppBar menampilkan jumlah produk yang ditandai favorit.
   - Jumlah favorite selalu diperbarui secara real-time ketika pengguna menambahkan atau menghapus favorit.

3. Halaman Favorite
   - Menampilkan daftar semua produk yang sudah difavoritkan.
   - Setiap item favorit dapat dibuka ke halaman detail.
   - Dapat menghapus produk dari favorit langsung dari halaman Favorite.

## Struktur Proyek

- `lib/main.dart`
  - Entry point aplikasi, mengonfigurasi `MultiProvider` untuk `ProductProvider` dan `FavoriteProvider`.

- `lib/pages/home_page.dart`
  - Halaman utama menampilkan daftar produk dan filter kategori.
  - Menggunakan `ProductCardComponent` untuk membuka `DetailPage`.

- `lib/pages/detail_page.dart`
  - Menampilkan informasi lengkap produk.
  - Menyediakan tombol favorite untuk menandai produk.

- `lib/pages/favorite_page.dart`
  - Halaman khusus yang menampilkan semua produk favorit.

- `lib/providers/product_provider.dart`
  - Mengambil daftar produk dari API dan mengelola status loading/error.

- `lib/providers/favorite_provider.dart`
  - Mengelola daftar produk favorit menggunakan `ChangeNotifier`.

- `lib/components/product_card_component.dart`
  - Komponen kartu produk untuk daftar di HomePage.

- `lib/components/favorite_component.dart`
  - Komponen ikon favorit di AppBar dengan badge jumlah favorit.

- `lib/models/product.dart`
  - Model data produk.

## Instalasi

1. Pastikan Flutter sudah terpasang di perangkat Anda.
2. Buka folder proyek:

```bash
cd "e:/tugas-kuliah/Semester 6/Praktikum Pemograman Mobile/itg_mobile_pertemuan_9"
```

3. Jalankan perintah:

```bash
flutter pub get
```

4. Jalankan aplikasi:

```bash
flutter run
```

## Catatan

- Aplikasi menggunakan paket `provider` untuk state management.
- Data produk diambil melalui service API yang sudah disiapkan di `lib/services/api_service.dart`.
- Favorit disimpan hanya selama sesi berjalan di memori; belum tersimpan secara permanen.

## Pengembangan

Jika ingin menambahkan fitur baru:

- Buat halaman baru di `lib/pages/`
- Tambahkan provider baru di `lib/providers/`
- Hubungkan halaman ke `main.dart` dan gunakan widget navigasi `Navigator.push`

Selamat mengembangkan aplikasi!