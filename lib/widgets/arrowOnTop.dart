import 'package:flutter/material.dart';
import 'package:indiancreator/utils/constants.dart';

class ArrowOnTop extends StatefulWidget {
  final VoidCallback onPressed;

  const ArrowOnTop({Key? key, required this.onPressed}) : super(key: key);

  @override
  _ArrowOnTopState createState() => _ArrowOnTopState();
}

class _ArrowOnTopState extends State<ArrowOnTop> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: widget.onPressed,
            onHover: (isHovering) {
              if (isHovering) {
                setState(() {
                  isHover = true;
                });
              } else {
                setState(() {
                  isHover = false;
                });
              }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                boxShadow: isHover
                    ? [
                        BoxShadow(
                          color: kPrimaryColor.withAlpha(200),
                          blurRadius: 12.0,
                          offset: Offset(2.0, 3.0),
                        )
                      ]
                    : [],
              ),
              child: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.white,
                size: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
