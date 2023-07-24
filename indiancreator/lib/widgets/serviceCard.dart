import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final String? serviceIcon;
  final String? serviceTitle;
  final String? serviceDescription;
  final double? cardWidth;
  final double? cardHeight;

  const ServiceCard(
      {super.key, this.serviceIcon,
      this.serviceTitle,
      this.serviceDescription,
      this.cardHeight,
      this.cardWidth});

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: widget.cardWidth,
        height: widget.cardHeight,
        padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.circular(8.0),),
      ),
    );
  }
}
