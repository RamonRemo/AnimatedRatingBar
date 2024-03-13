<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A simple animated rating bar to help you implement a rating system in your app.

## Features

 - Change between 5 types of animation(bounce, shake, bounceDiagonally, rotate and none)
 - Change the intensity of the animations
 - Use any widget as rating indicator

## Usage

1. Declare a AnimatedRatingBar with the desired parameters, the rowHeight parameter should have the same height that you rating widget has.

```dart
    AnimatedRatingBar(
        animationType: ARBAnimationType.shake,
        rowHeight: 50,
        emptyWidget: Icon(
          Icons.star_border_rounded,
          size: 48,
          color: Colors.white,
        ),
        fullWidget: Icon(
          Icons.star_rounded,
          size: 48,
          color: Colors.white,
        ),
    ),
```

![](example/assets/shake.gif) 


2. Then pass the key to the WidgetToImage selecting the constructor of type that you want

```dart
final dartUiImage = await WidgetToImage.asDartUiImage(key);
final byte = await WidgetToImage.asByteData(key);
final uint = await WidgetToImage.asUint8List(key);
final image = await WidgetToImage.asImage(key);
```

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.

todo
remover text
