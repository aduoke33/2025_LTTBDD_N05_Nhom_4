import 'package:flutter/material.dart';

class AboutTeamScreen extends StatelessWidget {
  final String currentLanguage;

  const AboutTeamScreen({super.key, this.currentLanguage = 'en'});

  static const Map<String, String> _vi = {
    'title': 'Về Nhóm Phát Triển',
    'project_info': 'Thông Tin Dự Án',
    'course': 'Môn học',
    'course_name': 'Lập trình trên thiết bị di động',
    'university': 'Trường',
    'university_name': 'Đại học Phenikaa',
    'team_members': 'Thành Viên Nhóm',
    'member1_name': 'Ngô Đặng Nhật Dũng',
    'member1_id': 'MSV: 23010329',
    'member2_name': 'Nguyễn Duy Hiệu',
    'member2_id': 'MSV: 23010363',
  };

  static const Map<String, String> _en = {
    'title': 'About The Team',
    'project_info': 'Project Information',
    'course': 'Course',
    'course_name': 'Mobile Application Development',
    'university': 'University',
    'university_name': 'Phenikaa University',
    'team_members': 'Team Members',
    'member1_name': 'Ngo Dang Nhat Dung',
    'member1_id': 'ID: 23010329',
    'member2_name': 'Nguyen Duy Hieu',
    'member2_id': 'ID: 23010363',
  };

  String _getText(String key) {
    if (currentLanguage == 'en') {
      return _en[key] ?? key;
    }
    return _vi[key] ?? key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getText('title')),
      ),
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
                    _getText('project_info'),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: Text(_getText('course')),
                    subtitle: Text(_getText('course_name')),
                  ),
                  ListTile(
                    leading: const Icon(Icons.school),
                    title: Text(_getText('university')),
                    subtitle: Text(_getText('university_name')),
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
                    _getText('team_members'),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const CircleAvatar(child: Text('D')),
                    title: Text(_getText('member1_name')),
                    subtitle: Text(_getText('member1_id')),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const CircleAvatar(child: Text('H')),
                    title: Text(_getText('member2_name')),
                    subtitle: Text(_getText('member2_id')),
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
