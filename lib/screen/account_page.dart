import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/cubit/auth_cubit.dart';
import '../auth/cubit/auth_state.dart';
import 'package:cure_app_3/widget/widget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>();

  bool _selectedPatient = true;
  bool _isLogin = true;

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _experienceController = TextEditingController();
  final _areaController = TextEditingController();
  final _skillsController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _experienceController.dispose();
    _areaController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  Future<void> _handleAuth() async {
    if (!_formKey.currentState!.validate()) return;

    final authCubit = context.read<AuthCubit>();

    if (_selectedPatient) {
      if (_isLogin) {
        await authCubit.login(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        await authCubit.registerPatient(
          name: _fullNameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
          password: _passwordController.text.trim(),
        );
      }
    } else {
      await authCubit.registerNurse(
        name: _fullNameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        password: _passwordController.text.trim(),
        experience: _experienceController.text.trim(),
        area: _areaController.text.trim(),
        skills: _skillsController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.error && state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }

        if (state.status == AuthStatus.authenticatedPatient) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.accountStatus == 'approved'
                    ? 'تم تسجيل حساب المريض بنجاح'
                    : 'تم تسجيل الدخول بنجاح',
              ),
            ),
          );

          // لاحقًا سنضيف التنقل التلقائي هنا بعد ربط router
          // مثال: Patient shell
        }

        if (state.status == AuthStatus.authenticatedNurse) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.accountStatus == 'pending'
                    ? 'تم إرسال طلب الممرض بنجاح'
                    : 'تم تسجيل دخول الممرض بنجاح',
              ),
            ),
          );

          // لاحقًا سنضيف التنقل التلقائي هنا بعد ربط router
          // مثال: Nurse shell أو صفحة انتظار الموافقة
        }
      },
      builder: (context, state) {
        final isLoading = state.status == AuthStatus.loading;

        return CurePageScaffold(
          location: 'الفيوم، مصر',
          avatarLabel: 'P',
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
              children: [
                const SizedBox(height: 8),
                const Text(
                  'حسابي / انضم إلينا',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF00408B),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'سجّل كـ مريض أو ممرض وابدأ رحلة الرعاية المنزلية.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF424752),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 18),

                CureRoleSwitcher(
                  patientLabel: 'مريض',
                  nurseLabel: 'ممرض',
                  selectedPatient: _selectedPatient,
                  onChanged: (value) {
                    setState(() {
                      _selectedPatient = value;
                      if (!_selectedPatient) {
                        _isLogin = false;
                      }
                    });
                  },
                ),

                const SizedBox(height: 18),

                if (_selectedPatient)
                  CureAuthCard(
                    title: _isLogin ? 'تسجيل الدخول' : 'إنشاء حساب',
                    subtitle: _isLogin
                        ? 'ادخل بياناتك للوصول إلى حسابك.'
                        : 'أنشئ حسابًا جديدًا كمريض.',
                    fields: [
                      if (!_isLogin)
                        CureTextField(
                          controller: _fullNameController,
                          hintText: 'الاسم الكامل',
                        ),
                      CureTextField(
                        controller: _emailController,
                        hintText: 'البريد الإلكتروني',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      if (!_isLogin)
                        CureTextField(
                          controller: _phoneController,
                          hintText: 'رقم الهاتف',
                          keyboardType: TextInputType.phone,
                        ),
                      CureTextField(
                        controller: _passwordController,
                        hintText: 'كلمة المرور',
                        obscureText: true,
                      ),
                    ],
                    primaryAction: _isLogin ? 'تسجيل الدخول' : 'إنشاء حساب',
                    secondaryAction: _isLogin
                        ? 'ليس لدي حساب'
                        : 'لدي حساب بالفعل',
                    onPrimaryAction: isLoading ? () {} : _handleAuth,
                    onSecondaryAction: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                  )
                else
                  CureJoinCard(
                    title: 'انضم كـ ممرض',
                    subtitle: 'أرسل بياناتك وسنراجع طلبك خلال فترة قصيرة.',
                    fields: [
                      CureTextField(
                        controller: _fullNameController,
                        hintText: 'الاسم الكامل',
                      ),
                      CureTextField(
                        controller: _phoneController,
                        hintText: 'رقم الهاتف',
                        keyboardType: TextInputType.phone,
                      ),
                      CureTextField(
                        controller: _emailController,
                        hintText: 'البريد الإلكتروني',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      CureTextField(
                        controller: _experienceController,
                        hintText: 'سنوات الخبرة',
                        keyboardType: TextInputType.number,
                      ),
                      CureTextField(
                        controller: _areaController,
                        hintText: 'المنطقة السكنية',
                      ),
                      CureTextField(
                        controller: _skillsController,
                        hintText: 'التخصصات والمهارات',
                      ),
                      CureTextField(
                        controller: _passwordController,
                        hintText: 'كلمة المرور',
                        obscureText: true,
                      ),
                    ],
                    primaryAction: isLoading ? 'جاري الإرسال...' : 'إرسال الطلب',
                    onPrimaryPressed: isLoading ? () {} : _handleAuth,
                  ),

                const SizedBox(height: 18),

                const CureContactCard(
                  title: 'تواصل معنا',
                  items: [
                    CureContactItem(label: 'الهاتف', value: '01070203636'),
                    CureContactItem(
                      label: 'البريد',
                      value: 'eslam.hamada@cureztyx.com',
                    ),
                    CureContactItem(
                      label: 'بريد إضافي',
                      value: 'curetechnology.info@gmail.com',
                    ),
                    CureContactItem(label: 'الموقع', value: 'الفيوم، مصر'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}