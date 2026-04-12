// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Edit 2.png
  AssetGenImage get edit2 => const AssetGenImage('assets/icons/Edit 2.png');

  /// File path: assets/icons/Note_Edit.png
  AssetGenImage get noteEdit =>
      const AssetGenImage('assets/icons/Note_Edit.png');

  /// File path: assets/icons/delete.png
  AssetGenImage get delete => const AssetGenImage('assets/icons/delete.png');

  /// File path: assets/icons/email.png
  AssetGenImage get email => const AssetGenImage('assets/icons/email.png');

  /// File path: assets/icons/fav.png
  AssetGenImage get fav => const AssetGenImage('assets/icons/fav.png');

  /// File path: assets/icons/favoreticon.png
  AssetGenImage get favoreticon =>
      const AssetGenImage('assets/icons/favoreticon.png');

  /// File path: assets/icons/home_icon.png
  AssetGenImage get homeIcon =>
      const AssetGenImage('assets/icons/home_icon.png');

  /// File path: assets/icons/password_icon.png
  AssetGenImage get passwordIcon =>
      const AssetGenImage('assets/icons/password_icon.png');

  /// File path: assets/icons/person_icon.png
  AssetGenImage get personIcon =>
      const AssetGenImage('assets/icons/person_icon.png');

  /// File path: assets/icons/selected_favorite_con.png
  AssetGenImage get selectedFavoriteCon =>
      const AssetGenImage('assets/icons/selected_favorite_con.png');

  /// File path: assets/icons/selected_home_icon.png
  AssetGenImage get selectedHomeIcon =>
      const AssetGenImage('assets/icons/selected_home_icon.png');

  /// File path: assets/icons/user_icon.png
  AssetGenImage get userIcon =>
      const AssetGenImage('assets/icons/user_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    edit2,
    noteEdit,
    delete,
    email,
    fav,
    favoreticon,
    homeIcon,
    passwordIcon,
    personIcon,
    selectedFavoriteCon,
    selectedHomeIcon,
    userIcon,
  ];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/book.png
  AssetGenImage get book => const AssetGenImage('assets/image/book.png');

  /// File path: assets/image/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/image/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [book, logo];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
