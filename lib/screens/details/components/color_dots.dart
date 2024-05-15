import 'package:flutter/material.dart';

import '../../../components/rounded_icon_btn.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              text: '3 Pekerjaan ',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Diselesaikan',
                  style: TextStyle(
                    color: Colors.green[800], // Atur warna teks menjadi hijau
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Stack(
                      children: [
                        ListView(
                          padding: const EdgeInsets.only(
                              top: 30, bottom: 16, left: 16, right: 16),
                          children: [
                            ListTile(
                              leading: Icon(Icons.location_on,
                                  color: Colors.orange[400]),
                              title: const Text("Tambah Tujuan Kunjungan"),
                              onTap: () {
                                Navigator.pop(context); // tutup modal
                                _showAddDestinationDialog(context);
                              },
                            ),
                            const Divider(height: 1),
                            ListTile(
                              leading: Icon(Icons.person_add,
                                  color: Colors.orange[400]),
                              title: const Text("Tambah User Outlet"),
                              onTap: () {
                                Navigator.pop(context); // tutup modal
                                _showAddUserDialog(context);
                              },
                            ),
                            const Divider(height: 1),
                            ListTile(
                              leading: Icon(Icons.add_a_photo,
                                  color: Colors.orange[400]),
                              title: const Text("Tambah Gambar"),
                              onTap: () {
                                Navigator.pop(context); // tutup modal
                                _showAddImageDialog(context);
                              },
                            ),
                          ],
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.black),
                            onPressed: () {
                              Navigator.pop(context); // tutup modal
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

void _showAddDestinationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Tambah Tujuan Kunjungan"),
        content: const TextField(
          decoration: InputDecoration(
            hintText: "Masukkan tujuan",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // tutup dialog
            },
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // tutup dialog
              // Tambah tujuan logic
            },
            child: const Text("Tambah"),
          ),
        ],
      );
    },
  );
}

void _showAddUserDialog(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Tambah User Outlet"),
        content: const TextField(
          decoration: InputDecoration(
            hintText: "Masukkan nama user",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // tutup dialog
            },
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // tutup dialog
              // Tambah user logic
            },
            child: const Text("Tambah"),
          ),
        ],
      );
    },
  );
}

void _showAddImageDialog(context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Tambah Gambar"),
        content: const Text("Form untuk tambah gambar"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // tutup dialog
            },
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // tutup dialog
              // Tambah gambar logic
            },
            child: const Text("Tambah"),
          ),
        ],
      );
    },
  );
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
