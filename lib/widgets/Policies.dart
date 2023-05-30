import 'package:flutter/material.dart';
import 'package:stepzilla/NavBar.dart';

class Policies extends StatefulWidget{

  @override
  _PolicyState createState() => _PolicyState();
}
class _PolicyState extends State<Policies>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('Policies'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '''Policy for StepZilla Fitness Tracker App

Effective Date: 30.05.2023

Introduction
This policy outlines the terms and conditions governing the use of our Fitness Tracker app ("App"), which tracks your steps and records your time. By downloading, installing, or using the App, you agree to comply with this policy. Please read this policy carefully before using the App.

Data Collection and Usage
2.1 Steps and Time Tracking

The App collects data related to your steps and time during physical activities. This data is used to provide you with insights and analysis to help you track your fitness progress. The App may access your device's built-in sensors, such as accelerometer or pedometer, to accurately record your steps and time. The collected data may be displayed within the App's interface and may be used to generate statistics, charts, and other visual representations.

2.2 Personal Information

To use the App's tracking features, you may be required to create an account or provide certain personal information, such as your name, email address, age, and gender. This information is collected solely for the purpose of personalizing your experience and providing accurate fitness tracking data. We are committed to safeguarding your personal information and adhere to applicable privacy laws and regulations. Please refer to our Privacy Policy for more details on how we handle your personal information.

Data Storage and Security
3.1 Data Storage

The App securely stores your fitness tracking data on our servers or cloud-based storage. This data is associated with your account and is used to provide you with a seamless experience across devices. We may also use aggregated and anonymized data for research and development purposes.

3.2 Data Security

We employ industry-standard security measures to protect your data from unauthorized access, disclosure, alteration, or destruction. However, no method of data transmission or storage can be guaranteed to be completely secure. You acknowledge that the security of your data also depends on your actions, such as keeping your login credentials confidential and regularly updating your device's operating system and security software.

Third-Party Integrations
The App may offer integrations with third-party services, such as health and fitness platforms or social media networks. When you choose to connect the App with these services, you may be sharing certain data with them. We encourage you to review the privacy policies and terms of service of these third-party services to understand how they handle your information.

User Responsibilities
5.1 Accurate Information

You are responsible for providing accurate and up-to-date information during the account creation process. Any inaccuracies or changes to your personal information should be promptly updated within the App.

5.2 Compliance with Laws and Regulations

You agree to use the App in compliance with all applicable laws, regulations, and guidelines. This includes respecting the privacy and rights of other individuals and refraining from engaging in any unlawful or unethical activities.

5.3 Informed Decision-Making

While the App provides insights and recommendations, you acknowledge that the accuracy and applicability of these suggestions may vary depending on individual factors. It is your responsibility to consult with qualified professionals, such as healthcare providers or fitness experts, before making any significant changes to your exercise routine or lifestyle based on the App's recommendations.

Updates and Modifications
We reserve the right to update or modify this policy at any time. We will notify you of any material changes via the App or other means of communication. By continuing to use the App after such updates, you accept and agree to the revised policy.

Contact Information
If you have any questions, concerns, or feedback regarding this policy or the App's privacy practices, please contact us at [provide contact details].

By using the Fitness Tracker app, you acknowledge that you have read, understood, and agreed to the terms and conditions outlined in this policy.
          '''
            , style: TextStyle(fontSize: 16.0), ),
      ),
    );
  }


}