import 'package:flutter/material.dart';
import 'package:myapp/screens/mulai_hitung.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 80, 117),
      body: Column(
        children: [
          // Header Section
          Stack(
            children: [
              Container(
                height: 240,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/header_background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 240,
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              ),
              Positioned(
                  top: 20,
                  left: 20,
                  right: 20, // Tambahkan agar ada batas kanan
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "vCount",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Vehicle Count",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Traffic Counting Mobile App",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 40),
                            Text(
                              "Dinas Perhubungan Kabupaten Batang",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Jl. Raya Kandeman KM 05 Batang Jawa Tengah",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/logo.png',
                        height: 70, // Atur tinggi logo
                        width: 70, // Atur lebar logo
                      ),
                    ],
                  )),
            ],
          ),

          // Buttons Section
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildButton(context, "Mulai Hitung", Icons.directions_car, 0),
                    buildButton(context, "Lihat Rekap", Icons.insert_chart, 1),
                    buildButton(context, "Lihat Grafik", Icons.show_chart, 2),
                    buildButton(context, "Informasi Aplikasi", Icons.info, 3),
                    Text(
                      "© 2023 vCount. All rights reserved.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(
      BuildContext context, String text, IconData icon, int menu) {
    return GestureDetector(
      onTap: () {
        // Tindakan ketika tombol diklik
        switch (menu) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MulaiHitung()),
            );
            break;
          case 1:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Kamu menekan tombol $text")),
            );
            break;
          case 2:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Kamu menekan tombol $text")),
            );
            break;
          case 3:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Kamu menekan tombol $text")),
            );
            break;
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200), // Efek animasi
        height: 80,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF007BFF), Color(0xFF00C6FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 30,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
