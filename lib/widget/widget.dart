import 'package:flutter/material.dart';

class CurePageScaffold extends StatelessWidget {
  final String location;
  final String avatarLabel;
  final Widget body;

  const CurePageScaffold({
    super.key,
    required this.location,
    required this.avatarLabel,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _TopBar(location: location, avatarLabel: avatarLabel),
          Expanded(child: body),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final String location;
  final String avatarLabel;

  const _TopBar({required this.location, required this.avatarLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFD8E3FA))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.location_on_rounded, color: Color(0xFF00408B)),
          const SizedBox(width: 10),
          Text(
            location,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF424752),
              height: 1.2,
            ),
          ),

          const Spacer(),
          const Text(
            'CURE',
            style: TextStyle(
              color: Color(0xFF00408B),
              fontSize: 24,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.0,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFFE2EEFF),
                child: Text(
                  avatarLabel,
                  style: const TextStyle(
                    color: Color(0xFF00408B),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w800,
            color: Color(0xFF00408B),
          ),
        ),
      ],
    );
  }
}

class CureHeroBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String accentLabel;

  const CureHeroBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.accentLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF8DB0D8), Color(0xFF00408B)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x2000408B),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: -26,
            bottom: -34,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: .10),
              ),
            ),
          ),
          Positioned(
            left: -16,
            top: -24,

            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: .08),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 22, 18, 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AccentPill(label: accentLabel),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 26,
                      height: 1.25,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Colors.white.withValues(alpha: .95),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AccentPill extends StatelessWidget {
  final String label;

  const _AccentPill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .16),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class CureStatItem {
  final String value;
  final String label;
  const CureStatItem({required this.value, required this.label});
}

class CureStatsRow extends StatelessWidget {
  final List<CureStatItem> stats;

  const CureStatsRow({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: stats
          .map(
            (stat) => Expanded(
              child: Container(
                margin: const EdgeInsetsDirectional.only(end: 10),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE2EEFF),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Text(
                      stat.value,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF00408B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stat.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF424752),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList()
          .reversed
          .toList(),
    );
  }
}

class CureInfoPanel extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color background;
  final Color borderColor;
  final List<String> items;

  const CureInfoPanel({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.background,
    required this.borderColor,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: iconColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '-',
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.1,
                      color: Color(0xFFBA1A1A),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.65,
                        color: Color(0xFF424752),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CureFeatureItem {
  final String title;
  final String description;
  final IconData icon;
  const CureFeatureItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class CureFeatureGrid extends StatelessWidget {
  final List<CureFeatureItem> items;

  const CureFeatureGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 520 ? 2 : 2;
        return GridView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFD8E3FA)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1000408B),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: const Color(
                      0xFF7CEDFF,
                    ).withValues(alpha: .5),
                    child: Icon(item.icon, color: const Color(0xFF006874)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111C2C),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF424752),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class CureTrustCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> bullets;

  const CureTrustCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.bullets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD8E3FA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF00408B),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              height: 1.55,
              color: Color(0xFF424752),
            ),
          ),
          const SizedBox(height: 14),
          ...bullets.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 7),
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: Color(0xFF006874),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.55,
                        color: Color(0xFF424752),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CureSearchBar extends StatelessWidget {
  final String hintText;

  const CureSearchBar({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE2EEFF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFF00408B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune_rounded, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.search_rounded, color: Color(0xFF424752)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              hintText,
              style: const TextStyle(fontSize: 15, color: Color(0xFF727784)),
            ),
          ),
        ],
      ),
    );
  }
}

class CureFilterChips extends StatelessWidget {
  final List<String> chips;
  final int selectedIndex;

  const CureFilterChips({
    super.key,
    required this.chips,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 10,
      children: List.generate(chips.length, (index) {
        final selected = index == selectedIndex;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF00408B) : const Color(0xFFE2EEFF),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            chips[index],
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFF424752),
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      }),
    );
  }
}

class CureServiceItem {
  final String title;
  final String description;
  final IconData icon;

  const CureServiceItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class CureServiceGrid extends StatelessWidget {
  final List<CureServiceItem> items;

  const CureServiceGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFD8E3FA)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: const Color(0xFF7CEDFF).withValues(alpha: .55),
                child: Icon(item.icon, color: const Color(0xFF006874)),
              ),
              const Spacer(),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF111C2C),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.description,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.45,
                  color: Color(0xFF424752),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CureHighlightCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String actionText;
  final String secondaryActionText;
  final IconData icon;

  const CureHighlightCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.actionText,
    required this.secondaryActionText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD8E3FA)),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0F0),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFFBA1A1A)),
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
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    color: Color(0xFF424752),
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _PillButton(label: actionText, primary: true),
                    _PillButton(label: secondaryActionText, primary: false),
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

class _PillButton extends StatelessWidget {
  final String label;
  final bool primary;

  const _PillButton({required this.label, required this.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: primary ? const Color(0xFF00408B) : const Color(0xFFE2EEFF),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: primary ? Colors.white : const Color(0xFF00408B),
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}

class CureStepItem {
  final String title;
  final String description;
  final List<String> chipLabels;
  final String? progressLabel;
  final int ratingStars;
  final bool imagePlaceholder;
  final IconData icon;

  const CureStepItem({
    required this.title,
    required this.description,
    required this.icon,
    this.chipLabels = const [],
    this.progressLabel,
    this.ratingStars = 0,
    this.imagePlaceholder = false,
  });
}

class CureStepTimeline extends StatelessWidget {
  final List<CureStepItem> steps;

  const CureStepTimeline({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: const Color(0xFF00408B),
                    child: Icon(step.icon, color: Colors.white, size: 22),
                  ),
                  if (index != steps.length - 1)
                    Container(
                      width: 2,
                      height: 170,
                      margin: const EdgeInsets.only(top: 6),
                      color: const Color(0xFFC9DCF7),
                    ),
                ],
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFD8E3FA)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF00408B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        step.description,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.55,
                          color: Color(0xFF424752),
                        ),
                      ),
                      if (step.chipLabels.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: step.chipLabels
                              .map((e) => _PillButton(label: e, primary: false))
                              .toList(),
                        ),
                      ],
                      if (step.imagePlaceholder) ...[
                        const SizedBox(height: 12),
                        Container(
                          height: 110,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: const LinearGradient(
                              colors: [Color(0xFFCFE8FF), Color(0xFF7CEDFF)],
                            ),
                          ),
                          child: const Icon(
                            Icons.place_rounded,
                            color: Color(0xFF00408B),
                            size: 42,
                          ),
                        ),
                      ],
                      if (step.progressLabel != null) ...[
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE2EEFF),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(999),
                                  child: const LinearProgressIndicator(
                                    minHeight: 8,
                                    value: 0.66,
                                    backgroundColor: Color(0xFFC9DCF7),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFF00408B),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                step.progressLabel!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF006874),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (step.ratingStars > 0) ...[
                        const SizedBox(height: 12),
                        Row(
                          children: List.generate(
                            step.ratingStars,
                            (i) => const Padding(
                              padding: EdgeInsetsDirectional.only(end: 4),
                              child: Icon(
                                Icons.star_border_rounded,
                                color: Color(0xFF006874),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CureBenefitsList extends StatelessWidget {
  final List<CureBenefitItem> items;

  const CureBenefitsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFD8E3FA)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7CEDFF).withValues(alpha: .55),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(item.icon, color: const Color(0xFF006874)),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.description,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.5,
                            color: Color(0xFF424752),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class CureBenefitItem {
  final String title;
  final String description;
  final IconData icon;
  const CureBenefitItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class CureImpactCard extends StatelessWidget {
  final String title;
  final List<CureImpactItem> items;

  const CureImpactCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE2EEFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w800,
              color: Color(0xFF00408B),
            ),
          ),
          const SizedBox(height: 14),
          ...items.map(
            (e) => Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFC9DCF7))),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      e.value,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF00408B),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      e.label,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF424752),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CureImpactItem {
  final String value;
  final String label;
  const CureImpactItem({required this.value, required this.label});
}

class CureRoleSwitcher extends StatelessWidget {
  final String patientLabel;
  final String nurseLabel;
  final bool selectedPatient;
  final ValueChanged<bool> onChanged;

  const CureRoleSwitcher({
    super.key,
    required this.patientLabel,
    required this.nurseLabel,
    required this.selectedPatient,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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
              onTap: () => onChanged(true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: selectedPatient
                      ? const Color(0xFF00408B)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  patientLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selectedPatient
                        ? Colors.white
                        : const Color(0xFF424752),
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
              onTap: () => onChanged(false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: !selectedPatient
                      ? const Color(0xFF00408B)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  nurseLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: !selectedPatient
                        ? Colors.white
                        : const Color(0xFF424752),
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
}

class CureAuthCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> fields;
  final String primaryAction;
  final String secondaryAction;
  final VoidCallback onPrimaryAction;
  final VoidCallback onSecondaryAction;

  const CureAuthCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.fields,
    required this.primaryAction,
    required this.secondaryAction,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return _CardSection(
      title: title,
      subtitle: subtitle,
      child: Column(
        children: [
          ...fields,
          PrimaryButton(text: primaryAction, onPressed: onPrimaryAction),
          const SizedBox(height: 10),
          OutlineButton(text: secondaryAction, onPressed: onSecondaryAction),
        ],
      ),
    );
  }
}

class CureJoinCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> fields;
  final String primaryAction;
  final VoidCallback onPrimaryPressed;

  const CureJoinCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.fields,
    required this.primaryAction,
    required this.onPrimaryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return _CardSection(
      title: title,
      subtitle: subtitle,
      child: Column(
        children: [
          ...fields,
          PrimaryButton(text: primaryAction, onPressed:onPrimaryPressed),
        ],
      ),
    );
  }
}

class CureTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  const CureTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFFF9F9FF),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD8E3FA)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD8E3FA)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF00408B), width: 1.5),
          ),
        ),
      ),
    );
  }
}

class CureContactCard extends StatelessWidget {
  final String title;
  final List<CureContactItem> items;

  const CureContactCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return _CardSection(
      title: title,
      subtitle: 'معلومات التواصل المباشرة مع فريق CURE.',
      child: Column(
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2EEFF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.contact_mail_rounded,
                        color: Color(0xFF00408B),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.label,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF727784),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.value,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class CureContactItem {
  final String label;
  final String value;
  const CureContactItem({required this.label, required this.value});
}

class _CardSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _CardSection({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD8E3FA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF00408B),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF424752),
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _InputMock extends StatelessWidget {
  final String label;

  const _InputMock({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD8E3FA)),
      ),
      child: Row(
        children: [
          const Icon(Icons.edit_outlined, size: 18, color: Color(0xFF727784)),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF727784), fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00408B),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OutlineButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF00408B),
          side: const BorderSide(color: Color(0xFF00408B), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
