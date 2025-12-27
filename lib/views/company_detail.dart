import 'package:flutter/material.dart';
import '../models/company_model.dart';

class CompanyDetailScreen extends StatelessWidget {
  final Company company;

  const CompanyDetailScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(company.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                company.logo,
                height: 100,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.business, size: 80),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              company.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text("CEO: ${company.ceoName}"),
            Text("Industry: ${company.industry}"),
            Text("Employees: ${company.employeeCount}"),
            Text("Market Cap: \$${company.marketCap}"),
            Text("Country: ${company.country}"),
            Text("Address: ${company.address}"),
            Text("ZIP: ${company.zip}"),
            Text("Domain: ${company.domain}"),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/feedback');
              },
              child: const Text("Send Feedback"),
            ),
          ],
        ),
      ),
    );
  }
}
