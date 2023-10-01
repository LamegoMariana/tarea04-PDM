import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_time/tiptime_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip time'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(''), // Divider
            TextField(
              controller: context.watch<TiptimeProvider>().getCost,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Cost of service',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  prefixIcon: Icon(Icons.room_service)),
            ),
            const Text(''), // Divider

            const Row(
              children: [
                Icon(
                  Icons.dinner_dining,
                  color: Colors.grey,
                  size: 25,
                ),
                Text('     '),
                Text(
                  'How was the service?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: context.read<TiptimeProvider>().radioGroupGenerator(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.credit_card,
                          color: Colors.grey,
                        ),
                        Text('     '),
                        Text(
                          'Round up tip',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Switch(
                  value: context
                      .watch<TiptimeProvider>()
                      .currentSelectedSwitch, // Valor actual del Switch
                  onChanged: (bool value) {
                    context.read<TiptimeProvider>().changeSwitch(value);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {},
                  color: Colors.green.shade700,
                  child: const Text(
                    "CALCULATE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Tip Amount: ${context.watch<TiptimeProvider>().getTip}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
