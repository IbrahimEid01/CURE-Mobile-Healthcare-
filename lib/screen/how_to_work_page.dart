import 'package:cure_app_3/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:cure_app_3/main.dart';

class HowToWorkPage extends StatelessWidget {
  const HowToWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        children: [
          const SizedBox(height: 8),
          const Text(
            '3 خطوات فقط للرعاية المنزلية',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF00408B)),
          ),
          const SizedBox(height: 6),
          const Text(
            'احصل على أفضل الكوادر الطبية في منزلك بسرعة وأمان.',
            style: TextStyle(fontSize: 16, color: Color(0xFF424752), height: 1.5),
          ),
          const SizedBox(height: 18),
          // CureSegmentedToggle(
          //   leftLabel: 'للمريض',
          //   rightLabel: 'للممرض',
          //   selectedLeft: true,
          // ),
          const SizedBox(height: 18),
          const CureStepTimeline(
            steps: [
              CureStepItem(
                title: 'اختر الخدمة',
                description: 'أكثر من 15 خدمة طبية بأسعار ثابتة.',
                chipLabels: ['حقن وريدية', 'غيار جروح', 'فحص ضغط'],
                icon: Icons.medical_information_rounded,
              ),
              CureStepItem(
                title: 'حدد الموقع والموعد',
                description: 'استخدم GPS لاختيار منزلك وتحديد الوقت المناسب.',
                imagePlaceholder: true,
                icon: Icons.explore_rounded,
              ),
              CureStepItem(
                title: 'استلم الممرض',
                description: 'ربط سريع مع أقرب ممرض مؤهل مع تتبع مباشر للوصول.',
                progressLabel: '6 دقائق',
                icon: Icons.route_rounded,
              ),
              CureStepItem(
                title: 'ادفع وقيّم',
                description: 'دفع إلكتروني آمن مع إمكانية تقييم الجودة بعد الخدمة.',
                ratingStars: 5,
                icon: Icons.verified_rounded,
              ),
            ],
          ),
          const SizedBox(height: 18),
          PrimaryButton(
            text: 'ابدأ الآن',
            onPressed: () {},
          ),
        ],
      
    );
  }
}
