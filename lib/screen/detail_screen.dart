import 'package:flutter/material.dart';
import 'package:wisata_candi_nada/models/candi.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;

  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //DetailHeader
          Stack(
            children: [
              // Gambar utama
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Tombol back kustom (slide berikutnya)
            ],
          ),
          //DetailInfo
          //DetailGalery
        ],
      ),
    );
  }
}