# Anchored package

A package that provides the widget position details.

## Getting started

Add dependency to pubspec.yaml file

## Usage

An example using it with TextField suffixIcon to show a Menu above it.

```dart
import 'package:anchored/anchored.dart';

class AnchoredTest extends StatelessWidget {
  const AnchoredTest({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Anchored(
          anchoredBuilder: (_, anchor, anchorCenter){
            return IconButton(
              onPressed: (){
                showMenu(
                  context: context, 
                  position: RelativeRect.fromLTRB(anchor.left, anchor.top, anchor.right, anchor.bottom), 
                  items: const [
                    PopupMenuItem(child: Text("copy")),
                    PopupMenuItem(child: Text("paste")),
                  ]
                );
              }, 
              icon: const Icon(Icons.arrow_drop_down)
            );
          },
        ),
      ),
    );
  }
}
```

## Support the plugin <a href="https://www.buymeacoffee.com/EddieGenius" target="_blank"><img src="https://i.imgur.com/aV6DDA7.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important; box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" > </a>
