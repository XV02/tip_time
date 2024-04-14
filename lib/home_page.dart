import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_time/provider/tip_time_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: context.watch<TipTimeProvider>().costController,
                decoration: InputDecoration(
                  labelText: "Cost of service:",
                  hintText: "Enter the amount",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          Column(
            children: radioGroupGenerator(),
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text("Round tip?"),
            trailing: Switch(
              value: context.watch<TipTimeProvider>().isRoundedRequested,
              onChanged: (bool updatedSwitchValue) {
                context
                    .read<TipTimeProvider>()
                    .setIsRoundedSelected(updatedSwitchValue);
              },
            ),
          ),
          MaterialButton(
            child: Text("CALCULATE"),
            onPressed: () {
              var cost = double.tryParse(
                      Provider.of<TipTimeProvider>(context, listen: false)
                          .costController
                          .text) ??
                  0.0;
              context.read<TipTimeProvider>().tipCalculation(cost);
            },
          ),
          Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                  "Tip amount: \$${context.watch<TipTimeProvider>().tipAmount.toStringAsFixed(2)}")),
        ],
      ),
    );
  }

  List<ListTile> radioGroupGenerator() {
    return context
        .watch<TipTimeProvider>()
        .radioGroupValues
        .entries
        .map((entry) => ListTile(
              leading: Image.asset(context
                  .watch<TipTimeProvider>()
                  .radioGroupAssets[entry.key]
                  .toString()),
              title: Text(entry.value),
              trailing: Radio(
                  value: entry.key,
                  groupValue: context.watch<TipTimeProvider>().currentRadio,
                  onChanged: (int? selectedRadio) {
                    context
                        .read<TipTimeProvider>()
                        .setSelectedRadio(selectedRadio);
                  }),
            ))
        .toList();
  }
}
