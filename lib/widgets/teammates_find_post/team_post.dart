import 'package:ace_broadcast/model/event_category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindTeamPostWidget extends StatefulWidget {
  final String opName;
  final String opProfile;
  final String lastDate;
  final int categoryId;
  final String postDescription;
  final VoidCallback onApply;

  const FindTeamPostWidget({
    super.key,
    required this.opName,
    required this.opProfile,
    required this.lastDate,
    required this.categoryId,
    required this.postDescription,
    required this.onApply,
  });

  @override
  State<FindTeamPostWidget> createState() => _FindTeamPostWidgetState();
}

class _FindTeamPostWidgetState extends State<FindTeamPostWidget> {
  final GlobalKey _applyButtonKey = GlobalKey(); // Key for Apply Button
  final GlobalKey _avatarKey = GlobalKey(); // Key for CircleAvatar
  Offset? _applyButtonOffset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateOffsets();
    });
  }

  void _calculateOffsets() {
    final RenderBox applyButtonBox =
        _applyButtonKey.currentContext?.findRenderObject() as RenderBox;
    final RenderBox avatarBox =
        _avatarKey.currentContext?.findRenderObject() as RenderBox;

    setState(() {
      _applyButtonOffset = applyButtonBox.localToGlobal(Offset.zero) -
          avatarBox.localToGlobal(Offset.zero) +
          Offset(0, 10); // Adjust the y-position by 10px
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final category =
        categories.firstWhere((cat) => cat.index == widget.categoryId);

    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
      child: Stack(
        children: [
          if (_applyButtonOffset != null)
            CustomPaint(
              size: Size(double.infinity, _applyButtonOffset!.dy),
              painter: CurvyLinePainter(
                  offset: _applyButtonOffset!, color: category.color),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    key: _avatarKey,
                    radius: 23,
                    backgroundImage: NetworkImage(widget.opProfile),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.opName,
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              widget.lastDate,
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.surfaceDim,
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                        Text(
                          category.name,
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: category.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Text(
                  widget.postDescription,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55, top: 10),
                child: SizedBox(
                  width: 85,
                  height: 30,
                  child: ElevatedButton(
                    key: _applyButtonKey,
                    onPressed: widget.onApply,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: isDarkMode
                          ? Colors.grey.shade900
                          : Theme.of(context).colorScheme.surface,
                      side: isDarkMode
                          ? BorderSide.none
                          : BorderSide(color: category.color, width: 1.5),
                    ),
                    child: Text(
                      'Apply',
                      style: GoogleFonts.lato(
                        color: isDarkMode ? Colors.white : category.color,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CurvyLinePainter extends CustomPainter {
  final Offset offset;
  final Color color;

  CurvyLinePainter({required this.offset, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(23, 60);

    path.lineTo(23, offset.dy - 20);

    path.quadraticBezierTo(
      23,
      offset.dy,
      offset.dx - 10,
      offset.dy + 5,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
