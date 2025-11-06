import 'package:english_forum_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AboutTeamScreen extends StatelessWidget {
  const AboutTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.get('aboutTheTeam') ?? 'About The Team')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.get('projectInfo') ?? 'Project Information',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: Text(l10n.get('course') ?? 'Course'),
                    subtitle: Text(
                      l10n.get('courseName') ??
                          'Mobile Application Development',
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.school),
                    title: Text(l10n.get('university') ?? 'University'),
                    subtitle: Text(
                      l10n.get('universityName') ?? 'Phenikaa University',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.get('teamMembers') ?? 'Team Members',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const CircleAvatar(child: Text('D')),
                    title: Text(
                      l10n.get('member1Name') ?? 'Ngo Dang Nhat Dung',
                    ),
                    subtitle: Text(l10n.get('member1Id') ?? 'ID: 23010329'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const CircleAvatar(child: Text('H')),
                    title: Text(l10n.get('member2Name') ?? 'Nguyen Duy Hieu'),
                    subtitle: Text(l10n.get('member2Id') ?? 'ID: 23010363'),
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
