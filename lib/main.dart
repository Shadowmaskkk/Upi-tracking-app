import 'package:flutter/material.dart';

void main() {
  runApp(const FinancialPulseApp());
}

class FinancialPulseApp extends StatelessWidget {
  const FinancialPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementing Dark Mode as the default per your localization strategy
    return MaterialApp(
      title: 'Financial Pulse',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.tealAccent,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Good Afternoon 👋'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              // Vernacular Toggle (English/Bengali/Hindi) goes here
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFinancialPulse(),
            const SizedBox(height: 30),
            const Text(
              "Your Day",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(child: _buildPlainLanguageFeed()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Magic Button: Triggers Voice Input
        },
        backgroundColor: Colors.tealAccent,
        icon: const Icon(Icons.mic, color: Colors.black),
        label: const Text(
          "Log Expense",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // 1. The "Human-First" Dashboard
  Widget _buildFinancialPulse() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "You've spent ₹1,200 today. You have ₹800 left to stay on budget.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, height: 1.4),
          ),
          const SizedBox(height: 20),
          // The "Safety Meter" Gradient Bar
          Container(
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Colors.green, Colors.orange, Colors.red],
                stops: [0.0, 0.7, 1.0],
              ),
            ),
            child: Row(
              children: [
                // Simulating the user's current progress (60% spent)
                Expanded(flex: 6, child: Container()),
                Container(
                  width: 4,
                  color: Colors.white,
                ),
                Expanded(flex: 4, child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 2. The "Plain Language" Feed
  Widget _buildPlainLanguageFeed() {
    // Mock data based on the AI JSON output
    final transactions = [
      {
        "visual_cue": "🍕",
        "plain_language_story": "You ordered dinner from Zomato.",
        "amount": "-₹459.00",
        "tag": "Luxury"
      },
      {
        "visual_cue": "📈",
        "plain_language_story": "You saved for your future (Fixed Deposit).",
        "amount": "-₹5,000.00",
        "tag": "Essential"
      },
      {
        "visual_cue": "☕",
        "plain_language_story": "You grabbed a coffee at the corner shop.",
        "amount": "-₹50.00",
        "tag": "Luxury"
      }
    ];

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final tx = transactions[index];
        return Card(
          color: const Color(0xFF1E1E1E),
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: Text(
              tx["visual_cue"]!,
              style: const TextStyle(fontSize: 32),
            ),
            title: Text(
              tx["plain_language_story"]!,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.top(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: tx["tag"] == "Essential"
                        ? Colors.blue.withOpacity(0.2)
                        : Colors.purple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tx["tag"]!,
                    style: TextStyle(
                      color: tx["tag"] == "Essential" ? Colors.blueAccent : Colors.purpleAccent,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            trailing: Text(
              tx["amount"]!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Trigger Bottom Sheet with drill-down info here
            },
          ),
        );
      },
    );
  }
}
