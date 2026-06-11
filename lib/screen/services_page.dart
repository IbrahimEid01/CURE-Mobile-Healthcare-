import 'package:cure_app_3/widget/widget.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  CurePageScaffold(
      location: 'الفيوم، مصر',
      avatarLabel: 'P',
      body:ListView(
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
           const SectionHeader(title: 'الخدمات الأساسية'),
    const SizedBox(height: 12),
    const CureServiceGrid(
      items: [
        CureServiceItem(
          title: 'إعطاء الحقن',
          description: 'عضل / تحت الجلد / وريد.',
          icon: Icons.medical_services_rounded,
        ),
        CureServiceItem(
          title: 'قياس السكر',
          description: 'السكر العشوائي والتراكمي.',
          icon: Icons.bloodtype_rounded,
        ),
        CureServiceItem(
          title: 'قياس ضغط الدم',
          description: 'متابعة الضغط بشكل دوري.',
          icon: Icons.monitor_heart_rounded,
        ),
        CureServiceItem(
          title: 'قياس الحرارة',
          description: 'قياس درجة حرارة الجسم.',
          icon: Icons.device_thermostat_rounded,
        ),
        CureServiceItem(
          title: 'العلامات الحيوية',
          description: 'Pulse – O2 – R.',
          icon: Icons.favorite_rounded,
        ),
        CureServiceItem(
          title: 'إعطاء الأدوية',
          description: 'في مواعيدها المحددة.',
          icon: Icons.medication_rounded,
        ),
        CureServiceItem(
          title: 'تركيب كانيولا',
          description: 'تركيب IV Cannula.',
          icon: Icons.water_drop_rounded,
        ),
        CureServiceItem(
          title: 'تركيب المحاليل',
          description: 'محاليل وريدية.',
          icon: Icons.local_hospital_rounded,
        ),
        CureServiceItem(
          title: 'متابعة الجفاف',
          description: 'تعويض السوائل ومتابعة الحالة.',
          icon: Icons.opacity_rounded,
        ),
      ],
    ),

    const SizedBox(height: 22),
    const SectionHeader(title: 'الجروح والرعاية الجلدية'),
    const SizedBox(height: 12),
    const CureServiceGrid(
      items: [
        CureServiceItem(
          title: 'غيار الجروح',
          description: 'بسيطة وعميقة.',
          icon: Icons.healing_rounded,
        ),
        CureServiceItem(
          title: 'تنظيف وتعقيم الجروح',
          description: 'عناية دقيقة لمنع العدوى.',
          icon: Icons.cleaning_services_rounded,
        ),
        CureServiceItem(
          title: 'غيار قدم السكري',
          description: 'رعاية متخصصة للقدم.',
          icon: Icons.directions_walk_rounded,
        ),
        CureServiceItem(
          title: 'قرح الفراش',
          description: 'علاج ومتابعة الجروح المزمنة.',
          icon: Icons.bed_rounded,
        ),
        CureServiceItem(
          title: 'متابعة ما بعد العمليات',
          description: 'رعاية الجروح بعد الجراحة.',
          icon: Icons.post_add_rounded,
        ),
        CureServiceItem(
          title: 'إزالة الغرز',
          description: 'Suture Removal بسيطة وآمنة.',
          icon: Icons.cut_rounded,
        ),
      ],
    ),

    const SizedBox(height: 22),
    const SectionHeader(title: 'رعاية كبار السن'),
    const SizedBox(height: 12),
    const CureServiceGrid(
      items: [
        CureServiceItem(
          title: 'رعاية طريح الفراش',
          description: 'رعاية كاملة للمريض.',
          icon: Icons.bedtime_rounded,
        ),
        CureServiceItem(
          title: 'استحمام المريض',
          description: 'لغير القادرين على الحركة.',
          icon: Icons.bathroom_rounded,
        ),
        CureServiceItem(
          title: 'تغيير الوضعية',
          description: 'للوقاية من القرح.',
          icon: Icons.sync_alt_rounded,
        ),
        CureServiceItem(
          title: 'المساعدة في التغذية',
          description: 'دعم أثناء تناول الطعام.',
          icon: Icons.restaurant_rounded,
        ),
        CureServiceItem(
          title: 'قضاء الحاجة',
          description: 'مساعدة المريض باحترام وخصوصية.',
          icon: Icons.wc_rounded,
        ),
        CureServiceItem(
          title: 'الدعم النفسي',
          description: 'متابعة الحالة النفسية والوعي.',
          icon: Icons.psychology_rounded,
        ),
        CureServiceItem(
          title: 'تنظيم الأدوية',
          description: 'مراجعة الجرعات اليومية.',
          icon: Icons.medication_liquid_rounded,
        ),
      ],
    ),

    const SizedBox(height: 22),
    const SectionHeader(title: 'الأمراض المزمنة'),
    const SizedBox(height: 12),
    const CureServiceGrid(
      items: [
        CureServiceItem(
          title: 'متابعة القلب',
          description: 'حالات القلب المزمنة.',
          icon: Icons.favorite_rounded,
        ),
        CureServiceItem(
          title: 'متابعة السكر',
          description: 'للمرضى المزمنين.',
          icon: Icons.bloodtype_rounded,
        ),
        CureServiceItem(
          title: 'متابعة الضغط',
          description: 'ارتفاع ضغط الدم.',
          icon: Icons.monitor_heart_rounded,
        ),
        CureServiceItem(
          title: 'الربو وضيق التنفس',
          description: 'متابعة التنفس بشكل دوري.',
          icon: Icons.air_rounded,
        ),
        CureServiceItem(
          title: 'خطة متابعة دورية',
          description: 'تنظيم زيارات ومتابعات.',
          icon: Icons.event_note_rounded,
        ),
        CureServiceItem(
          title: 'تسجيل القراءات',
          description: 'تحليل القراءات اليومية.',
          icon: Icons.bar_chart_rounded,
        ),
      ],
    ),

    const SizedBox(height: 22),
    const SectionHeader(title: 'خدمات ما بعد العمليات'),
    const SizedBox(height: 12),
    const CureServiceGrid(
      items: [
        CureServiceItem(
          title: 'متابعة بعد الجراحة',
          description: 'رعاية منزلية بعد العمليات.',
          icon: Icons.local_hospital_rounded,
        ),
        CureServiceItem(
          title: 'تغيير الضمادات',
          description: 'جراحية وبشكل دوري.',
          icon: Icons.badge_rounded,
        ),
        CureServiceItem(
          title: 'مضادات حيوية',
          description: 'بعد العمليات حسب الحاجة.',
          icon: Icons.medical_information_rounded,
        ),
        CureServiceItem(
          title: 'تنظيف الجروح الجراحية',
          description: 'متابعة التعقيم والنظافة.',
          icon: Icons.cleaning_services_rounded,
        ),
        CureServiceItem(
          title: 'متابعة المضاعفات',
          description: 'رصد الالتهابات أو المشاكل.',
          icon: Icons.warning_amber_rounded,
        ),
        CureServiceItem(
          title: 'المساعدة في الحركة',
          description: 'حركة تدريجية وآمنة.',
          icon: Icons.directions_walk_rounded,
        ),
      ],
    ),

    const SizedBox(height: 22),
    const SectionHeader(title: 'الرعاية التنفسية المنزلية'),
    const SizedBox(height: 12),
    const CureServiceGrid(
      items: [
        CureServiceItem(
          title: 'جلسات نيبولايزر',
          description: 'جلسات بخار.',
          icon: Icons.air_rounded,
        ),
        CureServiceItem(
          title: 'شفط بلغم',
          description: 'Suction للرعاية التنفسية.',
          icon: Icons.phonelink_ring_rounded,
        ),
        CureServiceItem(
          title: 'متابعة الأكسجين',
          description: 'المتابعة المنزلية للأكسجين.',
          icon: Icons.airline_seat_recline_normal_rounded,
        ),
        CureServiceItem(
          title: 'استخدام أجهزة التنفس',
          description: 'تعليم وتشغيل الأجهزة.',
          icon: Icons.settings_rounded,
        ),
        CureServiceItem(
          title: 'متابعة حالات الربو',
          description: 'رصد الحالة وتطورها.',
          icon: Icons.monitor_heart_rounded,
        ),
      ],
    ),

    const SizedBox(height: 22),
    const SectionHeader(title: 'القسطرة والإجراءات الخاصة'),
    const SizedBox(height: 12),
    const CureServiceGrid(
      items: [
        CureServiceItem(
          title: 'تركيب قسطرة بولية',
          description: 'تركيب القسطرة ومتابعتها.',
          icon: Icons.water_drop_rounded,
        ),
        CureServiceItem(
          title: 'تغيير القسطرة',
          description: 'متابعة النظافة والاستبدال.',
          icon: Icons.change_circle_rounded,
        ),
        CureServiceItem(
          title: 'العناية بالقسطرة',
          description: 'رعاية المريض والمكان.',
          icon: Icons.shield_rounded,
        ),
        CureServiceItem(
          title: 'متابعة البول',
          description: 'مراقبة المضاعفات.',
          icon: Icons.science_rounded,
        ),
      ],
    ),

    const SizedBox(height: 22),
    const SectionHeader(title: 'الدعم النفسي والتأهيلي'),
    const SizedBox(height: 12),
    const CureServiceGrid(
      items: [
        CureServiceItem(
          title: 'دعم نفسي بسيط',
          description: 'للمريض في المنزل.',
          icon: Icons.psychology_rounded,
        ),
        CureServiceItem(
          title: 'دعم الأسرة',
          description: 'التعامل مع الحالة.',
          icon: Icons.family_restroom_rounded,
        ),
        CureServiceItem(
          title: 'تمارين تأهيل منزلية',
          description: 'خطوات بسيطة وآمنة.',
          icon: Icons.fitness_center_rounded,
        ),
        CureServiceItem(
          title: 'علاج طبيعي خفيف',
          description: 'Mobility وتحسين الحركة.',
          icon: Icons.accessibility_new_rounded,
        ),
        CureServiceItem(
          title: 'تدريب على الحركة',
          description: 'مساعدة تدريجية للمريض.',
          icon: Icons.directions_walk_rounded,
        ),
      ],
    ),

    const SizedBox(height: 22),
    const SectionHeader(title: 'خدمات الطوارئ والتقييم السريع'),
    const SizedBox(height: 12),
    const CureServiceGrid(
      items: [
        CureServiceItem(
          title: 'تقييم حالة طارئة',
          description: 'في المنزل بشكل سريع.',
          icon: Icons.emergency_rounded,
        ),
        CureServiceItem(
          title: 'قياس سريع للحالة',
          description: 'تقييم الصحة العامة.',
          icon: Icons.monitor_heart_rounded,
        ),
        CureServiceItem(
          title: 'تجهيز النقل للمستشفى',
          description: 'تحضير الحالة للنقل.',
          icon: Icons.local_shipping_rounded,
        ),
        CureServiceItem(
          title: 'استشارة تمريضية عاجلة',
          description: 'رد سريع حسب الحالة.',
          icon: Icons.support_agent_rounded,
        ),
      ],
    ),
  ],),
);
  }}