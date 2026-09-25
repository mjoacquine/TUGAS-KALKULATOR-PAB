// lib/kalkulator.dart

class Kalkulator {
  // Fungsi penambahan
  double tambah(double a, double b) {
    return a + b;
  }

  // Fungsi pengurangan
  double kurang(double a, double b) {
    return a - b;
  }

  // Fungsi perkalian
  double kali(double a, double b) {
    return a * b;
  }

  // Fungsi pembagian dengan handling exception jika pembagi 0
  double bagi(double a, double b) {
    if (b == 0) {
      throw Exception('Kesalahan: Tidak dapat melakukan pembagian dengan angka nol!');
    }
    return a / b;
  }
}