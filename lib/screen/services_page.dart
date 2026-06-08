import 'package:cure_app_3/widget/widget.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        children: [
          const SizedBox(height: 8),
          const Text(
            'تغطية طبية شاملة',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFF00408B),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'لكل احتياجاتك الصحية في منزلك بأمان واحترافية.',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF424752),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          const CureSearchBar(hintText: 'ابحث عن خدمة أو إجراء طبي...'),
          const SizedBox(height: 14),
          const CureFilterChips(
            chips: ['الكل', 'عناية أساسية', 'الجروح', 'الخروج', 'كبار السن'],
            selectedIndex: 0,
          ),
          const SizedBox(height: 20),
          const SectionHeader(
            title: 'العناية الأساسية',
            actionText: 'عرض الكل',
          ),
          const SizedBox(height: 12),
          const CureServiceGrid(
            items: [
              CureServiceItem(
                title: 'العلامات الحيوية',
                description: 'ضغط، نبض، ودرجة الحرارة.',
                icon: Icons.monitor_heart_rounded,
              ),
              CureServiceItem(
                title: 'إعطاء حقن',
                description: 'وريدية، عضلية، أو تحت الجلد.',
                icon: Icons.medical_services_rounded,
              ),
            ],
          ),
          const SizedBox(height: 22),
          const SectionHeader(title: 'عناية الجروح', actionText: 'عرض الكل'),
          const SizedBox(height: 12),
          const CureHighlightCard(
            title: 'غيار على الجروح (قدم سكري)',
            subtitle: 'تطهير وتعقيم احترافي لمنع الالتهابات.',
            actionText: 'قرح الفراش',
            secondaryActionText: 'خياطة جراحية',
            icon: Icons.healing_rounded,
          ),
          const SizedBox(height: 22),
          const SectionHeader(title: 'رعاية كبار السن', actionText: 'عرض الكل'),
          const SizedBox(height: 12),
          const CureServiceGrid(
            items: [
              CureServiceItem(
                title: 'تركيب قسطرة',
                description: 'بولية أو أنبوب معدي.',
                icon: Icons.medication_liquid_rounded,
              ),
              CureServiceItem(
                title: 'علاج تقني',
                description: 'جلسات نيبولايزر وأكسجين.',
                icon: Icons.air_rounded,
              ),
            ],
          ),
        ],
      
    );
  }
}
