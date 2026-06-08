import 'package:cure_app_3/widget/widget.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
        children: [
          const SizedBox(height: 8),
          const Text(
            'حسابي / انضم إلينا',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF00408B)),
          ),
          const SizedBox(height: 6),
          const Text(
            'سجّل كـ مريض أو ممرض وابدأ رحلة الرعاية المنزلية.',
            style: TextStyle(fontSize: 16, color: Color(0xFF424752), height: 1.5),
          ),
          const SizedBox(height: 18),
          const CureRoleSwitcher(
            patientLabel: 'مريض',
            nurseLabel: 'ممرض',
            selectedPatient: true,
          ),
          const SizedBox(height: 18),
          const CureAuthCard(
            title: 'إنشاء حساب',
            subtitle: 'سجّل دخولك أو أنشئ حسابًا جديدًا بسهولة.',
            fields: [
              'الاسم الكامل',
              'البريد الإلكتروني',
              'رقم الهاتف',
              'كلمة المرور',
            ],
            primaryAction: 'إنشاء حساب',
            secondaryAction: 'لدي حساب بالفعل',
          ),
          const SizedBox(height: 18),
          const CureJoinCard(
            title: 'انضم كـ ممرض',
            subtitle: 'أرسل بياناتك وسنراجع طلبك خلال فترة قصيرة.',
            fields: [
              'الاسم الكامل',
              'رقم الهاتف',
              'البريد الإلكتروني',
              'سنوات الخبرة',
              'المنطقة السكنية',
              'التخصصات والمهارات',
            ],
            primaryAction: 'إرسال الطلب',
          ),
          const SizedBox(height: 18),
          const CureContactCard(
            title: 'تواصل معنا',
            items: [
              CureContactItem(label: 'الهاتف', value: '01070203636'),
              CureContactItem(label: 'البريد', value: 'eslam.hamada@cureztyx.com'),
              CureContactItem(label: 'بريد إضافي', value: 'curetechnology.info@gmail.com'),
              CureContactItem(label: 'الموقع', value: 'الفيوم، مصر'),
            ],
          ),
        ],
      );
  }
}