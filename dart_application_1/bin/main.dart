// bin/main.dart
import 'dart:io';
import 'package:dart_application_1/kalkulator.dart';

void main() async {
  Kalkulator kalkulator = Kalkulator();
  bool ulang = true;

  print('========================================');
  print('    APLIKASI KALKULATOR SEDERHANA     ');
  print('========================================');

  while (ulang) {
    try {
      // 1. Input Bilangan Pertama
      double bil1 = readDoubleInput('Masukkan bilangan pertama: ');

      // 2. Input Bilangan Kedua
      double bil2 = readDoubleInput('Masukkan bilangan kedua: ');

      // 3. Menampilkan Menu Pilihan Operasi
      print('\nPilih Operasi Matematika:');
      print('[1] Tambah');
      print('[2] Kurang');
      print('[3] Kali');
      print('[4] Bagi');
      
      stdout.write('Pilih operasi (1-4): ');
      String? pilihan = stdin.readLineSync();

      double hasil = 0;

      // Simulasi proses perhitungan
      await Future.delayed(Duration(milliseconds: 300)); 

      switch (pilihan) {
        case '1':
          hasil = kalkulator.tambah(bil1, bil2);
          print('\nHasil Tambah: $bil1 + $bil2 = $hasil');
          break;
        case '2':
          hasil = kalkulator.kurang(bil1, bil2);
          print('\nHasil Kurang: $bil1 - $bil2 = $hasil');
          break;
        case '3':
          hasil = kalkulator.kali(bil1, bil2);
          print('\nHasil Kali: $bil1 * $bil2 = $hasil');
          break;
        case '4':
          hasil = kalkulator.bagi(bil1, bil2);
          print('\nHasil Bagi: $bil1 / $bil2 = $hasil');
          break;
        default:
          print('\n[Error] Pilihan operasi tidak valid! Silahkan pilih angka 1-4.');
      }

    } catch (e) {
      // Menangkap exception dari kesalahan input angka atau pembagian nol
      print('\n[Terjadi Kesalahan]: ${e.toString()}');
    }

    // 4. Konfirmasi Mengulang
    print('\n----------------------------------------');
    stdout.write('Apakah Anda ingin melakukan perhitungan lagi? (Y/T): ');
    String? jawaban = stdin.readLineSync()?.trim().toUpperCase();

    if (jawaban != 'Y') {
      ulang = false;
      print('\nTerima kasih telah menggunakan aplikasi kalkulator!');
    }
    print('----------------------------------------\n');
  }
}

/// Fungsi pembantu untuk membaca input angka dari pengguna secara aman
double readDoubleInput(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();

    if (input != null && input.isNotEmpty) {
      double? value = double.tryParse(input);
      if (value != null) {
        return value;
      }
    }
    print('[Error] Input tidak valid! Harap masukkan angka yang benar (misal: 10 atau 3.14).\n');
  }
}