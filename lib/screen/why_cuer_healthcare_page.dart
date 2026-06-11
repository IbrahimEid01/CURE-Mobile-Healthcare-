import 'package:cure_app_3/widget/widget.dart';
import 'package:flutter/material.dart';

class WhyCureHealthcarePage extends StatelessWidget {
  const WhyCureHealthcarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CurePageScaffold(
      location: 'الفيوم، مصر',
      avatarLabel: 'P',
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        children: [
          const SizedBox(height: 8),
          const Text(
            'لماذا كيور؟',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF00408B)),
          ),
          const SizedBox(height: 6),
          const Text(
            '6 أسباب تجعلنا الخيار الأول للرعاية المنزلية في الفيوم.',
            style: TextStyle(fontSize: 16, color: Color(0xFF424752), height: 1.5),
          ),
          const SizedBox(height: 18),
          const CureBenefitsList(
            items: [
              CureBenefitItem(
                title: 'أمان تام',
                description: 'هوية ومؤهلات طبية موثقة لجميع الممرضين.',
                icon: Icons.shield_rounded,
              ),
              CureBenefitItem(
                title: 'سرعة الاستجابة',
                description: 'وصول الممرض خلال 15 دقيقة داخل المدينة.',
                icon: Icons.flash_on_rounded,
              ),
              CureBenefitItem(
                title: 'أسعار شفافة',
                description: 'بدون رسوم مخفية أو تفاوض متعب.',
                icon: Icons.payments_rounded,
              ),
              CureBenefitItem(
                title: 'جودة مضمونة',
                description: 'نظام تقييم مستمر يرفع المعايير الطبية.',
                icon: Icons.star_rounded,
              ),
              CureBenefitItem(
                title: 'دعم مستمر 24/7',
                description: 'فريق خدمة العملاء متاح طوال اليوم.',
                icon: Icons.headset_mic_rounded,
              ),
              CureBenefitItem(
                title: 'تغطية الفيوم',
                description: 'بداية محلية مع قابلية للتوسع لاحقًا.',
                icon: Icons.map_rounded,
              ),
            ],
          ),
          const SizedBox(height: 18),
          const CureImpactCard(
            title: 'أرقام تعكس ثقتكم',
            items: [
              CureImpactItem(value: '+150', label: 'مشارك في الأبحاث'),
              CureImpactItem(value: '87%', label: 'تفضيل المرضى للخدمة'),
              CureImpactItem(value: '91%', label: 'اهتمام الكوادر الطبية'),
            ],
          ),
          const SizedBox(height: 18),
          PrimaryButton(
            text: 'اطلب الخدمة الآن',
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          OutlineButton(
            text: 'انضم إلينا كممرض',
            onPressed: () {},
          ),
        ],
      ),
        )
    );
  }
}