import 'package:cure_app_3/widget/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CurePageScaffold(
      location: 'الفيوم، مصر',
      avatarLabel: 'P',
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        children: [
          const SizedBox(height: 10),
          CureHeroBanner(
            title: 'كيور — الرعاية الصحية\nحق للجميع',

            subtitle:
                'أول منصة ذكية تربط المرضى بممرض منزلي معتمد في مدينة الفيوم.',
            accentLabel: 'Home',
          ),
          const SizedBox(height: 22),
          const CureStatsRow(
            stats: [
              CureStatItem(value: '15+', label: 'خدمة طبية'),
              CureStatItem(value: '15 د', label: 'وقت الوصول'),
              CureStatItem(value: '100%', label: 'ممرض معتمد'),
            ],
          ),
          const SizedBox(height: 22),
          const CureInfoPanel(
            title: 'لماذا نحتاج "كيور"؟',
            icon: Icons.warning_amber_rounded,
            iconColor: Color(0xFFBA1A1A),
            background: Color(0xFFFFF7F6),
            borderColor: Color(0xFFF1D0CC),
            items: [
              'فترات انتظار طويلة للحصول على خدمات طبية بسيطة.',
              'تلاعب في الأسعار وعدم شفافية التكاليف.',
              'صعوبة التأكد من هوية ومؤهلات أطقم التمريض.',
            ],
          ),
          const SizedBox(height: 20),
          const SectionHeader(title: 'ما الذي يميز كيور؟'),
          const SizedBox(height: 12),
          const CureFeatureGrid(
            items: [
              CureFeatureItem(
                title: 'ممرضون معتمدون',
                description: 'فحص دقيق للهوية والمؤهلات الطبية.',
                icon: Icons.verified_user_rounded,
              ),
              CureFeatureItem(
                title: 'أسعار شفافة',
                description: 'تسعيرة ثابتة لكل خدمة دون مفاجآت.',
                icon: Icons.payments_rounded,
              ),
              CureFeatureItem(
                title: 'ضمان الجودة',
                description: 'نظام تقييم شفاف يرفع مستوى الخدمة.',
                icon: Icons.star_rounded,
              ),
              CureFeatureItem(
                title: 'استجابة سريعة',
                description: 'وصول الممرض في أقل من 15 دقيقة.',
                icon: Icons.flash_on_rounded,
              ),
            ],
          ),
          const SizedBox(height: 22),
          PrimaryButton(text: 'اطلب الخدمة الآن', onPressed: () {}),
          const SizedBox(height: 12),
          OutlineButton(text: 'انضم كممرض', onPressed: () {}),
          const SizedBox(height: 24),
          const SectionHeader(title: 'لماذا يثق الناس في كيور؟'),
          const SizedBox(height: 12),
          const CureTrustCard(
            title: 'منصة رعاية منزلية متمركزة حول المريض',
            subtitle: 'نقاط قوة عملية وعناصر ثقة واضحة في كل رحلة علاجية.',
            bullets: [
              'خدمات ميدانية منزلية متعددة.',
              'دعم متواصل 24/7.',
              'مسار حجز واضح ومباشر.',
            ],
          ),
        ],
      ),
    );
  }
}
