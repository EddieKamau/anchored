library anchored;

import 'package:flutter/material.dart';

/// [Anchored] Provides the widget position details.
/// Usage example
/// ```dart
/// Anchored(
///   anchoredBuilder: (_, anchor, anchorCenter){
///     return IconButton(
///       onPressed: (){
///         showMenu(
///           context: context, 
///           position: RelativeRect.fromLTRB(anchor.left, anchor.top, anchor.right, anchor.bottom), 
///           items: [
///             const PopupMenuItem(child: Text("copy")),
///             const PopupMenuItem(child: Text("paste")),
///           ]
///         );
///       }, 
///       icon: const Icon(Icons.arrow_drop_down)
///     );
///   },
/// )
/// ```
class Anchored extends StatefulWidget {
  const Anchored({required this.anchoredBuilder, super.key});
  final Widget Function(BuildContext, Rect anchorBounds, Offset anchor)
      anchoredBuilder;

  @override
  State<Anchored> createState() => _AnchoredState();
}

class _AnchoredState extends State<Anchored> {
  var topLeft = const Offset(0, 0);
  var bottomRight = const Offset(0, 0);
  late Rect anchorBounds;
  late Offset anchorCenter;

  void _calcAnchor(RenderBox box) {
    if (box.hasSize) {
      topLeft = box.size.topLeft(box.localToGlobal(const Offset(0.0, 0.0)));
      bottomRight =
          box.size.bottomRight(box.localToGlobal(const Offset(0.0, 0.0)));
    }

    anchorBounds = Rect.fromLTRB(
      topLeft.dx,
      topLeft.dy,
      bottomRight.dx,
      bottomRight.dy,
    );
    anchorCenter = box.hasSize ? box.size.center(topLeft) : const Offset(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      RenderBox box = context.findRenderObject() as RenderBox;
      if (!box.hasSize) {
        Future.delayed(const Duration(microseconds: 1)).then((value) {
          setState(() {
            _calcAnchor(box);
          });
        });
      }
      _calcAnchor(box);

      return widget.anchoredBuilder(context, anchorBounds, anchorCenter);
    });
  }
}
