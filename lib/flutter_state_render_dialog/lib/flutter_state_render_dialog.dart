import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DialogRender {
  static void show({
    required BuildContext context,
    required StateRenderType stateRenderType,
    required String message,
    String title = '',
    void Function()? retryAction,
    Widget? child,
  }) {
    showDialog(
      context: context,
      builder: (context) => StateRender(
        stateRenderType: stateRenderType,
        message: message,
        title: title,
        retryAction: retryAction,
        child: child,
      ),
    );
  }
}

class StateRender extends StatelessWidget {
  final StateRenderType stateRenderType;
  final String message;
  final String title;
  final void Function()? retryAction;
  final Widget? child;

  const StateRender({
    Key? key,
    required this.stateRenderType,
    required this.message,
    this.title = '',
    this.retryAction,
    this.child,
  }) : super(key: key);

  String get animatedAsset {
    switch (stateRenderType) {
      case StateRenderType.popUpLoadingState:
        return 'assets/json/loading.json';
      case StateRenderType.popUpErrorState:
        return 'assets/json/error.json';
      case StateRenderType.popUpSuccessState:
        return 'assets/json/success.json';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAnimatedAsset(),
            const SizedBox(height: 8),
            _buildMessageText(),
            const SizedBox(height: 16),
            if (stateRenderType != StateRenderType.popUpLoadingState)
              _buildPopUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedAsset() {
    return SizedBox(
      height: 100,
      width: 100,
      child: Lottie.asset(animatedAsset),
    );
  }

  Widget _buildMessageText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildPopUpButton() {
    return SizedBox(
      width: double.infinity,
      child: child ??
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: retryAction,
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
    );
  }
}

enum StateRenderType {
  popUpLoadingState,
  popUpErrorState,
  popUpSuccessState,
}
