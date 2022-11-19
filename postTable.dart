
import 'frequencychart.dart';
import 'post.dart';
import 'package:flutter/material.dart';

class PostTable extends StatefulWidget {
  const PostTable({Key? key}) : super(key: key);

  State<PostTable> createState() => _PostTableState();
}

class _PostTableState extends State<PostTable> {
  List<Post>? _posts;
  int? _sortColumnIndex;
  bool? _sortAscending;

  @override
  void initState() {
    super.initState();
    _posts = Post.generateData();
    _sortColumnIndex = 0;
    _sortAscending = true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("DataTable and Chart(lab08)"), actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FrequencyChart()));
              },
              icon: Icon(Icons.bar_chart_sharp))
        ]),
        body: DataTable(
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending!,
            columns: <DataColumn>[

              DataColumn(
                  numeric: false,
                  label: Text('title'),
                  onSort: (index, ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;
                      _posts!.sort((a, b) {
                        if (ascending) {
                          return a.numUpVotes!.compareTo(b.numUpVotes!);
                        }
                        return b.numUpVotes!.compareTo(a.numUpVotes!);
                      });
                    });
                  }),
              DataColumn(
                  numeric: true,
                  label: Text(' '),
                  onSort: (index, ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;
                      _posts!.sort((a, b) {
                        if (ascending) {
                          return a.numUpVotes!.compareTo(b.numUpVotes!);
                        }
                        return b.numUpVotes!.compareTo(a.numUpVotes!);
                      });
                    });
                  }),
              DataColumn(
                  numeric: true,
                  label: Text(' '),
                  onSort: (index, ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;
                      _posts!.sort((a, b) {
                        if (ascending) {
                          return a.numDownVotes!.compareTo(b.numDownVotes!);
                        }
                        return b.numDownVotes!.compareTo(a.numDownVotes!);
                      });
                    });
                  }),
            ],
            rows: List<DataRow>.from(_posts!
                .map((Post entry) => DataRow(cells: [
              DataCell(Text(entry.title.toString())),
              DataCell(Row(children: [
                Text('${entry.numUpVotes}'),
                IconButton(
                    onPressed: () {
                      setState(() {
                        entry.numUpVotes =
                             (entry.numUpVotes ?? 0) + 1;
                      });
                    },
                    icon: Icon(Icons.arrow_upward_sharp))
              ])),
              DataCell(Row(children: [
                Text('${entry.numDownVotes}'),
                IconButton(
                    onPressed: () {
                      setState(() {
                        entry.numDownVotes =
                            (entry.numDownVotes ?? 0) + 1;
                      });
                    },
                    icon: Icon(Icons.arrow_downward_sharp))
              ]))
            ]))
                .toList())));
  }
}
