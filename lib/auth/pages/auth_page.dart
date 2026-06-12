import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isPatient = true;

  String get _roleLabel => _isPatient ? 'مريض' : 'ممرض';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 16),
            const Text(
              'مرحبًا بك في CURE',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF00408B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'اختر نوع الحساب ثم انتقل إلى تسجيل الدخول أو إنشاء الحساب.',
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Color(0xFF424752),
              ),
            ),
            const SizedBox(height: 24),

            _buildRoleSelector(),
            const SizedBox(height: 24),

            _buildInfoCard(
              icon: Icons.person_rounded,
              title: 'حساب المريض',
              subtitle: 'للمستخدم الذي يريد حجز خدمة رعاية منزلية ومتابعة طلباته.',
              selected: _isPatient,
              onTap: () {
                setState(() {
                  _isPatient = true;
                });
              },
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.medical_services_rounded,
              title: 'حساب الممرض',
              subtitle: 'للمتخصص الذي يستقبل الطلبات وينظم جدول التوفر.',
              selected: !_isPatient,
              onTap: () {
                setState(() {
                  _isPatient = false;
                });
              },
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  context.push('/login', extra: _isPatient ? 'patient' : 'nurse');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00408B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'تسجيل الدخول كـ $_roleLabel',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton(
                onPressed: () {
                  context.push('/register', extra: _isPatient ? 'patient' : 'nurse');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF00408B),
                  side: const BorderSide(color: Color(0xFF00408B), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'إنشاء حساب $_roleLabel',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleSelector() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFE2EEFF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {
                setState(() {
                  _isPatient = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: _isPatient ? const Color(0xFF00408B) : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  'مريض',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _isPatient ? Colors.white : const Color(0xFF424752),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {
                setState(() {
                  _isPatient = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: !_isPatient ? const Color(0xFF00408B) : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  'ممرض',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: !_isPatient ? Colors.white : const Color(0xFF424752),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFDDEBFF) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? const Color(0xFF00408B) : const Color(0xFFD8E3FA),
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE2EEFF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: const Color(0xFF00408B)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF00408B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: Color(0xFF424752),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}