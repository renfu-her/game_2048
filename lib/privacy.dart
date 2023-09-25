import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicyPage extends StatefulWidget {
  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String? _privacyPolicyContent;

  @override
  void initState() {
    super.initState();
    _fetchPrivacyPolicy();
  }

  Future<void> _fetchPrivacyPolicy() async {
    final response = await http
        .get(Uri.parse('https://wingx.shop/api/get_policy/1')); // 替换为您的隐私策略URL

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      setState(() {
        _privacyPolicyContent = responseData['content']; // 提取content字段
      });
    } else {
      setState(() {
        _privacyPolicyContent = 'Failed to load privacy policy.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('隱私權政策'),
        backgroundColor: const  Color(0xFFFF5F42),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _privacyPolicyContent != null
            ? Html(data: _privacyPolicyContent!)
            : const CircularProgressIndicator(), // 在加载内容时显示一个加载指示器
      ),
    );
  }
}
