import 'package:flutter/material.dart';
import 'package:state_render/flutter_state_render_dialog/lib/flutter_state_render_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Render State',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _showDialog(BuildContext context) {
    dialogRender(
      context: context,
      stateRenderType: StateRenderType.popUpLoadingState,
      message: 'Loading...',
      title: '',
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
      dialogRender(
        context: context,
          stateRenderType: StateRenderType.popUpSuccessState,
          message: 'Thanks',
          title: '',
          retryAction: () {
            Navigator.of(context).pop();
            dialogRender(
              context: context,
              stateRenderType: StateRenderType.popUpWarningState,
              message: 'Error',
              title: '',
              child: MaterialButton(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'),
              ),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.black54,
          onPressed: () => _showDialog(context),
          child: const Text(
            'Show Dialog',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
