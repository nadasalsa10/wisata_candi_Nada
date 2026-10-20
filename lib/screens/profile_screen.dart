import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan.
  bool isSignedIn = true; 
  String fullName = 'Muhammad Rachmadi';
  String userName = 'rachmadi';
  int favoriteCandiCount = 0;

  void _signIn() {
    setState(() {
      isSignedIn = true;
    });
  }

  void _signOut() {
    setState(() {
      isSignedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang ungu di bagian atas
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          // Konten Utama
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 130),
                
                // TODO: 2. Buat bagian ProfileHeader yang berisi gambar profil
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.deepPurple, width: 1.5),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: const AssetImage('assets/images/placeholder_image.png'),
                          child: const Icon(
                            Icons.person,
                            size: 65,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if (isSignedIn)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              constraints: const BoxConstraints(),
                              padding: const EdgeInsets.all(4),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 18,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // TODO: 3. Buat bagian ProfileInfo yang berisi info Profile
                // Row 1: Pengguna (Tanpa Icon Edit)
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.lock, color: Colors.amber),
                          SizedBox(width: 8),
                          Text(
                            'Pengguna',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': $userName',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.grey, thickness: 0.5),
                const SizedBox(height: 8),

                // Row 2: Nama (Dengan Icon Edit di Ujung Kanan)
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'Nama',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': $fullName',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    if (isSignedIn)
                      const Icon(Icons.edit, size: 20, color: Colors.black54),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.grey, thickness: 0.5),
                const SizedBox(height: 8),

                // Row 3: Favorit (Tanpa Icon Edit)
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 8),
                          Text(
                            'Favorit',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': $favoriteCandiCount',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.grey, thickness: 0.5),
                const SizedBox(height: 30),

                // TODO: 4. Buat bagian ProfileAction yang berisi TextButton sign in/sign out
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isSignedIn
                        ? TextButton(
                            onPressed: _signOut,
                            child: const Text(
                              'Sign Out',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : TextButton(
                            onPressed: _signIn,
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}