import 'package:flutter/material.dart';

class PLPPage extends StatefulWidget {
  final MaterialColor color;
  final String title;
  final int catId;
  final ValueChanged<int> onPush;
  PLPPage({this.color, this.title, this.catId, this.onPush});

  @override
  _PLPPageState createState() => _PLPPageState();
}

class _PLPPageState extends State<PLPPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(
          '${widget.title}',
        ),
      ),
      body: GestureDetector(
        onTap: () {
          var updatedCatId = widget.catId + 1;
          widget.onPush(updatedCatId);
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "PLP Cat_Id: ${widget.catId}",
            style: TextStyle(
              color: this.widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
