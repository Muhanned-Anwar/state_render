import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StateRender extends StatelessWidget {
  final StateRenderType stateRenderType;
  final String message;
  final String title;
  final void Function()? retryAction;

  StateRender({
    Key? key,
    required this.stateRenderType,
    this.message = 'Loading',
    this.title = '',
    this.retryAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAnimatedAsset(),
            SizedBox(height: 8),
            _buildMessageText(),
            SizedBox(height: 16),
            if (stateRenderType != StateRenderType.popUpLoadingState)
              _buildPopUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedAsset() {
    String animatedAsset = '';
    switch (stateRenderType) {
      case StateRenderType.popUpLoadingState:
        animatedAsset = 'loading.json';
        break;
      case StateRenderType.popUpErrorState:
        animatedAsset = 'error.json';
        break;
      case StateRenderType.popUpSuccessState:
        animatedAsset = 'success.json';
        break;
    }

    return SizedBox(
      height: 100,
      width: 100,
      child: Lottie.asset(animatedAsset),
    );
  }

  Widget _buildMessageText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildPopUpButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: retryAction,
        child: Text(
          'OK',
          style: TextStyle(fontSize: 16, color: Colors.white),
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
