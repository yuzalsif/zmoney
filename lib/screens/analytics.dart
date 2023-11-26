import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AnalyticsPage extends StatefulWidget {
  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  List<String> timePeriods = [
    'This Week',
    'Last Week',
    'This Month',
    'Last Month',
    'This Year'
  ];

  final data = [
    new Sales('Jan 1', 5),
    new Sales('Jan 2', 25),
    new Sales('Jan 3', 100),
    new Sales('Jan 4', 75),
  ];

  @override
  Widget build(BuildContext context) {
    var series = [
      new charts.Series<Sales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Sales sales, _) => sales.day,
        measureFn: (Sales sales, _) => sales.sales,
        data: data,
      )
    ];

    var chart = new charts.BarChart(series);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 233, 233),
      appBar: AppBar(
        title: Text('Analytics'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: timePeriods
                  .map((period) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chip(label: Text(period)),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: chart,
            ),
            const SizedBox(
              height: 16,
            ),
            ...history
          ],
        ),
      ),
    );
  }

  final history = [
    Container(
      width: 368,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        tileColor: Colors.white,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'deposit',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '24 04 2012.08:00 pm',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF979797),
              ),
            ),
          ],
        ),
        trailing: Text(
          'Tshs 124,000',
          style: TextStyle(
            color: Color(0xFF27AE60),
            fontSize: 14,
          ),
        ),
      ),
    ),
    SizedBox(
      height: 8,
    ),
    Container(
      width: 368,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        tileColor: Colors.white,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'withdrew money for food',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '24 04 2012.08:00 pm',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF979797),
              ),
            ),
          ],
        ),
        trailing: Text(
          'Tshs -124,000',
          style: TextStyle(
            color: Color(0xFFE74C3C),
            fontSize: 14,
          ),
        ),
      ),
    ),
    SizedBox(
      height: 8,
    ),
    Container(
      width: 368,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        tileColor: Colors.white,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'money request',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '24 04 2012.08:00 pm',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF979797),
              ),
            ),
          ],
        ),
        trailing: Text(
          'Tshs 124,000',
          style: TextStyle(
            color: Color(0xFFF39C12),
            fontSize: 14,
          ),
        ),
      ),
    ),
  ];
}

class Sales {
  final String day;
  final int sales;

  Sales(this.day, this.sales);
}
