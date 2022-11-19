import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'post.dart';

class FrequencyChart extends StatefulWidget {
  FrequencyChart({Key? key}) : super(key: key);

  @override
  State<FrequencyChart> createState() => _FrequencyChartState();
}

class _FrequencyChartState extends State<FrequencyChart> {
  List _post = Post.generateData();
  @override
  void initState() {
    super.initState();
    _post = Post.generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Stats"),
      ),
      body: Container(
        child: SizedBox.square(
          child: charts.BarChart(
            [
              charts.Series(
                  id: "Grade Frequency Data",
                  domainFn: (gf, _) => gf.title,
                  measureFn: (gf, _) => gf.numUpVotes,
                  data: _post),
              charts.Series(
                  id: "other",
                  domainFn: (gf, _) => gf.title,
                  measureFn: (gf, _) => gf.numDownVotes,
                  colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
                  data: _post)
            ],
            animate: true,
            vertical: false,
          ),
        ),
      ),
    );
  }
}
