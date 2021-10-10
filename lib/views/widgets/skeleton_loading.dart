import 'package:flutter/material.dart';
import 'package:social/constant/colors.dart';

class SkeletonLoadingContainer extends StatefulWidget {
  final bool loading;
  final Widget child;

  const SkeletonLoadingContainer({
    Key? key,
    required this.loading,
    required this.child,
  }) : super(key: key);

  @override
  _SkeletonLoadingContainerState createState() =>
      _SkeletonLoadingContainerState();
}

class _SkeletonLoadingContainerState extends State<SkeletonLoadingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController.unbounded(vsync: this)
      ..addListener(changes)
      ..repeat(min: -2, max: 2, period: const Duration(seconds: 2));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController.removeListener(changes);
    super.dispose();
  }

  get gradient => LinearGradient(
        colors: skeletonGradient.colors,
        stops: skeletonGradient.stops,
        begin: skeletonGradient.begin,
        end: skeletonGradient.end,
        transform:
            _SlidingGradientTransform(slidePercent: _animationController.value),
      );

  changes() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.loading) {
      return widget.child;
    }

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bonds) {
        return gradient.createShader(bonds);
      },
      child: widget.child,
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
