import 'package:flutter/material.dart';

class ArrowProfileItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final String? content;
  final bool hasToggle;

  const ArrowProfileItem({
    required this.title,
    required this.icon,
    this.content,
    this.hasToggle = false,
    super.key,
  });

  @override
  _ArrowProfileItemState createState() => _ArrowProfileItemState();
}

class _ArrowProfileItemState extends State<ArrowProfileItem> {
  bool isSwitched = false;

  void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          child: widget.hasToggle
              ? Ink(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.withOpacity(0.2)),
                            child: Icon(
                              widget.icon,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              if (widget.content != null &&
                                  widget.content!.isNotEmpty)
                                Text(
                                  widget.content!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                        child: Switch(
                          value: isSwitched,
                          onChanged: _toggleSwitch,
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                )
              : InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Ink(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.withOpacity(0.2)),
                              child: Icon(
                                widget.icon,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                if (widget.content != null &&
                                    widget.content!.isNotEmpty)
                                  Text(
                                    widget.content!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
