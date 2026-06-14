import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDark = false;
  bool isFollowing = false;
  bool isCalled = false;
  int followers = 3200;
  int projects = 24;
  String experience = '2y';

  void toggleTheme() => setState(() => isDark = !isDark);

  void toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
      followers += isFollowing ? 1 : -1;
    });
  }

  void toggleCall() => setState(() => isCalled = !isCalled);

  @override
  Widget build(BuildContext context) {
    final Color bg        = isDark ? const Color(0xFF0F1115) : const Color(0xFFF0F5FA);
    final Color cardBg    = isDark ? const Color(0xFF1A1D25) : Colors.white;
    final Color primary   = isDark ? Colors.white : const Color(0xFF1A1D25);
    final Color secondary = isDark ? Colors.white60 : Colors.grey.shade500;

    return Scaffold(
      backgroundColor: bg,

      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: isDark ? Colors.white : const Color(0xFF1A1D25),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: bg,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: toggleTheme,
            icon: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              color: isDark ? Colors.white : const Color(0xFF1A1D25),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 10),

            // ── PROFILE TOP ──────────────────────────────────────────────────
            Center(
              child: Column(
                children: [

                  // Avatar
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.deepPurple.shade200,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.2),
                              blurRadius: 16,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 52,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.deepPurple,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.code,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Name
                  Text(
                    'Fahmida Chowdhury Tamanna',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Designation
                  Text(
                    'Flutter Developer | SWE 5th Batch',
                    style: TextStyle(fontSize: 13, color: secondary),
                  ),

                  const SizedBox(height: 20),

                  // ── BUTTONS ──────────────────────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // Follow Button
                      SizedBox(
                        width: 150,
                        child: ElevatedButton.icon(
                          onPressed: toggleFollow,
                          icon: Icon(
                            isFollowing ? Icons.check : Icons.add,
                            size: 16,
                          ),
                          label: Text(
                            isFollowing ? 'Following' : 'Follow',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isFollowing
                                ? Colors.grey.shade400
                                : Colors.deepPurple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Message Button
                      SizedBox(
                        width: 150,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chat_bubble_outline,
                            size: 16,
                          ),
                          label: const Text(
                            'Message',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.deepPurple,
                            side: const BorderSide(
                              color: Colors.deepPurple,
                              width: 1.5,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ── STATS ────────────────────────────────────────────────
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 10),
                    decoration: BoxDecoration(
                      color: cardBg,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _statTile(
                              '$projects', 'Projects', primary, secondary),
                        ),
                        _divider(),
                        Expanded(
                          child: _statTile(
                              '${(followers / 1000).toStringAsFixed(1)}K',
                              'Followers',
                              primary,
                              secondary),
                        ),
                        _divider(),
                        Expanded(
                          child: _statTile(
                              experience, 'Experience', primary, secondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ── PROFILE DETAILS ──────────────────────────────────────────────
            Text(
              'Profile Details',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),

            const SizedBox(height: 14),

            _detailCard(
              Icons.email_outlined,
              'Email',
              'fahmidachowdhury207@gmail.com',
              cardBg,
              secondary,
            ),
            _detailCard(
              Icons.badge_outlined,
              'Student ID',
              '232-134-021',
              cardBg,
              secondary,
            ),
            _detailCard(
              Icons.school_outlined,
              'Department',
              'Software Engineering',
              cardBg,
              secondary,
            ),
            _detailCard(
              Icons.account_balance_outlined,
              'University',
              'Metropolitan University, Sylhet',
              cardBg,
              secondary,
            ),
            _detailCard(
              Icons.groups_outlined,
              'Batch',
              '5th Batch',
              cardBg,
              secondary,
            ),
            _detailCard(
              Icons.location_on_outlined,
              'Location',
              'Sylhet, Bangladesh',
              cardBg,
              secondary,
            ),

            const SizedBox(height: 28),

            // ── ABOUT ME ─────────────────────────────────────────────────────
            Text(
              'About Me',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                'Passionate Flutter developer who loves building beautiful, '
                    'performant mobile applications. Currently exploring UI/UX '
                    'design and clean architecture while completing my degree in '
                    'Software Engineering at Metropolitan University, Sylhet.',
                style: TextStyle(
                  color: secondary,
                  fontSize: 14,
                  height: 1.7,
                ),
              ),
            ),

            const SizedBox(height: 28),

            // ── SKILLS ───────────────────────────────────────────────────────
            Text(
              'Skills',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'Flutter',
                'Dart',
                'Firebase',
                'REST API',
                'Git',
                'UI/UX',
              ].map((s) => _skillChip(s, isDark)).toList(),
            ),

            const SizedBox(height: 28),

            // ── CALL BUTTON ──────────────────────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: toggleCall,
                icon: Icon(
                  isCalled ? Icons.call_end : Icons.call,
                  size: 18,
                ),
                label: Text(
                  isCalled ? 'End Call' : 'Call Now',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isCalled ? Colors.red : Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ── HELPERS ───────────────────────────────────────────────────────────────

  Widget _statTile(
      String value, String label, Color primary, Color secondary) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: secondary)),
      ],
    );
  }

  Widget _divider() {
    return Container(
      height: 36,
      width: 1,
      color: Colors.grey.withOpacity(0.2),
    );
  }

  Widget _detailCard(IconData icon, String label, String value,
      Color cardBg, Color secondary) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: Colors.deepPurple),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  color: secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1D25),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _skillChip(String label, bool dark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(dark ? 0.25 : 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.deepPurple.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: dark ? Colors.deepPurple.shade100 : Colors.deepPurple,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}