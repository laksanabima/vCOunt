import 'package:flutter/material.dart';

class MulaiHitung extends StatefulWidget {
  const MulaiHitung({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MulaiHitungState createState() => _MulaiHitungState();
}

class _MulaiHitungState extends State<MulaiHitung> {
  // Controllers untuk input
  TextEditingController tanggalController = TextEditingController();
  TextEditingController waktuController = TextEditingController();
  TextEditingController jalanController = TextEditingController();
  TextEditingController cuacaController = TextEditingController();
  TextEditingController petugasController = TextEditingController();

  String? _selectedCuaca;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Variabel untuk counter
  int sepedaMotorCount = 0;
  int mobilCount = 0;
  int truckCount = 0;
  int sepedaCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mulai Hitung'),
        backgroundColor: const Color.fromARGB(255, 151, 194, 244),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Tanggal dan Waktu Catat
            buildInputFields(),
            const SizedBox(height: 40),

            // Counter untuk kendaraan
            const Text(
              "Hitung Kendaraan yang Melewati",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),
            buildVehicleCounter(
              label: "Sepeda Motor",
              icon: Icons.motorcycle,
              color: Colors.orange,
              count: sepedaMotorCount,
              onIncrement: () {
                setState(() {
                  sepedaMotorCount++;
                });
              },
            ),
            const SizedBox(height: 30),
            buildVehicleCounter(
              label: "Mobil",
              icon: Icons.directions_car,
              color: Colors.blue,
              count: mobilCount,
              onIncrement: () {
                setState(() {
                  mobilCount++;
                });
              },
            ),
            const SizedBox(height: 30),
            buildVehicleCounter(
              label: "Truck",
              icon: Icons.local_shipping,
              color: Colors.green,
              count: truckCount,
              onIncrement: () {
                setState(() {
                  truckCount++;
                });
              },
            ),
            const SizedBox(height: 30),
            buildVehicleCounter(
              label: "Sepeda",
              icon: Icons.pedal_bike,
              color: Colors.purple,
              count: sepedaCount,
              onIncrement: () {
                setState(() {
                  sepedaCount++;
                });
              },
            ),
            const SizedBox(height: 40),

            // Tombol Simpan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Tombol Reset
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      sepedaMotorCount = 0;
                      mobilCount = 0;
                      truckCount = 0;
                      sepedaCount = 0;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Data hitungan berhasil direset!"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red, // Warna teks dan ikon
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Sudut melengkung
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    elevation: 5, // Efek bayangan tombol
                  ),
                  icon: const Icon(
                    Icons.refresh, // Ikon untuk tombol Reset
                    color: Colors.white,
                    size: 24,
                  ),
                  label: const Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Tombol Simpan
                ElevatedButton.icon(
                  onPressed: () {
                    print('Data disimpan');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.green, // Warna teks dan ikon
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Sudut melengkung
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    elevation: 5, // Efek bayangan tombol
                  ),
                  icon: const Icon(
                    Icons.save, // Ikon untuk tombol Simpan
                    color: Colors.white,
                    size: 24,
                  ),
                  label: const Text(
                    'Simpan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat input fields
  Widget buildInputFields() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Input Tanggal
              Expanded(
                child: TextField(
                  controller: tanggalController,
                  readOnly: true, // Tidak dapat diketik, hanya memilih dari DatePicker
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tanggal Catat',
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        tanggalController.text =
                            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                      });
                    }
                  },
                ),
              ),
              const SizedBox(width: 20),

              // Input Waktu Catat
              Expanded(
                child: TextField(
                  controller: waktuController,
                  readOnly: true, // Tidak dapat diketik, hanya memilih dari TimePicker
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Jam Awal Catat',
                  ),
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        waktuController.text =
                            '${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}';
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            controller: jalanController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nama Jalan (Lokasi Catat)',
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                value: _selectedCuaca,
                onChanged: (value) {
                  setState(() {
                    _selectedCuaca = value;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: 'Cerah',
                    child: Text('Cerah'),
                  ),
                  DropdownMenuItem(
                    value: 'Hujan',
                    child: Text('Hujan'),
                  ),
                  DropdownMenuItem(
                    value: 'Berawan',
                    child: Text('Berawan'),
                  ),
                  DropdownMenuItem(
                    value: 'Berkabut',
                    child: Text('Berkabut'),
                  ),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kondisi Cuaca',
                ),
              ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: petugasController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Petugas',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat counter kendaraan
  Widget buildVehicleCounter({
    required String label,
    required IconData icon,
    required Color color,
    required int count,
    required VoidCallback onIncrement,
  }) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 20),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                count.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 30),
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: onIncrement,
              ),
            ],
          ),
        ],
      ),
    );
  }
}