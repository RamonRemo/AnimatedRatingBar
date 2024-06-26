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

![DEMO0](example/assets/mario_large.gif)

A simple animated rating bar to help you implement a rating system in your app.

## Features

- :star: Change between 8 types of animation (bounce, shake, rotate, jump and others).
- :dizzy: Choose a curve for the animation.
- :muscle: Adjust the intensity of the animations.
- :basketball: Use any widget as rating indicator.
- :books: You choose how many rating objects will be.
- :point_down: Select a rating by tapping.
- :rainbow: Includes a toggleable Cascade-Animation.
- :clock10: Choose the duration of everything.

## Usage

1. Declare an `AnimatedRatingBar` with the desired parameters.

```dart
    AnimatedRatingBar(
        animationType: ARBAnimationType.rotate,
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

![DEMO1](example/assets/rotate.gif)

2. Use the shake animation:

![DEMO2](example/assets/shake.gif)

3. Or the bounce animation:

![DEMO3](example/assets/bounce.gif)

4. Explore other parameters to customize your rating bar, including animation intensity and rating widget selection. You can retrieve the current rating value using the onRatingChanged callback method.

```dart
    AnimatedRatingBar(
        animationType: ARBAnimationType.rotate,
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
        //here
        onRatingChanged: (value) {
            int rating = value;
        },
    ),
```

## Additional information

Feel free to submit pull requests or suggest changes on issues (on GitHub). A simple example is available on the GitHub repository.
