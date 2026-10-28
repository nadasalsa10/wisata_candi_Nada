import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_nada/providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // watch: layar ini ikut build ulang saat status sign in berubah
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                //TODO: 2. Buat ProfileHeader (foto profil)
                const SizedBox(height: 150),
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('images/placeholder_image.png'),
                        ),
                      ),
                      if (auth.isSignedIn)
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.deepPurple[50],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}