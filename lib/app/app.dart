import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import '../theme.dart';

enum AppMode { off, working }

extension on AppMode {
  T when<T>({required T Function() off, required T Function() working}) {
    switch (this) {
      case AppMode.off:
        return off();
      case AppMode.working:
        return working();
    }
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AppMode _appMode = AppMode.off;
  void toggleAppMode() {
    _appMode.when(
      off: () => setState(() => _appMode = AppMode.working),
      working: () => setState(() => _appMode = AppMode.off),
    );
  }

  String get _computeTitle {
    return _appMode.when(
      off: () => "Lets Work",
      working: () => 'Take a break',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedSwitcher(
          duration: AppDurations.slow,
          child: _appMode == AppMode.off ? Off() : Working(),
        ),
        Positioned(
          top: 32,
          right: 32,
          child: PushButton(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.white,
            onPressed: toggleAppMode,
            buttonSize: ButtonSize.small,
            child: Text(_computeTitle),
          ),
        ),
        Positioned(
          bottom: 32,
          left: 32,
          right: 32,
          child: ProgressBar(
            value: 30,
            trackColor: AppColors.white,
            backgroundColor: AppColors.gray,
          ),
        ),
      ],
    );
  }
}

class AtHome extends StatelessWidget {
  AtHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.gray,
      child: Center(
        child: Image.asset(Assets.home.path),
      ),
    );
  }
}

class Working extends StatelessWidget {
  Working({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.green,
      child: Center(
        child: Image.asset(Assets.coding.path),
      ),
    );
  }
}

class Off extends StatelessWidget {
  Off({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.blue,
      child: Center(
        child: Image.asset(Assets.off.path),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: 0.15,
          duration: AppDurations.slow,
          child: child,
        ),
        Center(
          child: ProgressCircle(),
        ),
      ],
    );
  }
}
