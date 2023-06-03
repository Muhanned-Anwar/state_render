# FlutterStateRenderDialog

FlutterStateRenderDialog is a library that provides a set of customizable dialogs for rendering different states in a Flutter application, such as loading, error, and success states.

## Installation

To use FlutterStateRenderDialog, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_state_render_dialog: ^1.0.0
```
## Usage

Import the package in your Dart file:
`import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';`

Use the `dialogRender` function to show the state render dialog:
```dialogRender(
  context: context,
  stateRenderType: StateRenderType.popUpLoadingState,
  message: 'Loading...',
);
```

You can customize the dialog by providing additional parameters such as the dialog title, retry action, or a custom child widget.

## StateRenderType
The `StateRenderType` enum defines the different types of state render dialogs available:

`popUpLoadingState`: Displays a loading state dialog.
`popUpErrorState`: Displays an error state dialog.
`popUpSuccessState`: Displays a success state dialog.

## Contributing
Contributions are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request on the GitHub repository.

## License
This library is released under the MIT License.
