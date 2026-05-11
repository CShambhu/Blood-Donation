import 'package:flutter/material.dart';

class BloodCampaigns extends StatefulWidget {
  const BloodCampaigns({super.key});

  @override
  State<BloodCampaigns> createState() => _BloodCampaignsState();
}

class _BloodCampaignsState extends State<BloodCampaigns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(" Blood Campaigns")));
  }
}
