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

 - Change between 5 types of animation(bounce, shake, bounceDiagonally, rotate and none).
 - Change the intensity of the animations.
 - Use any widget as rating indicator.
 - Rating 1 to 5.

## Usage

1. Declare a AnimatedRatingBar with the desired parameters, the rowHeight parameter should have the same height that you rating widget has.

```dart
    AnimatedRatingBar(
        animationType: ARBAnimationType.rotate,
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
![](example/assets/rotate.gif) 


2. You can use shake:

![](example/assets/shake.gif) 

3. Or bounce:

![](example/assets/bounce.gif)

4. There are others parameters you can change to personalize your ratingbar like animation intensity, rating widget. You can recover the rating value using the callback method

```dart
    AnimatedRatingBar(
        animationType: ARBAnimationType.rotate,
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
        //here
        onRatingChanged: (value) {
            int rating = value;
        },
    ),
```


## Additional information

Feel free to do pull requests or ask for changes on issues(on gitHub). There is a simple example on the github.