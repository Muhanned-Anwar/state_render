# FlutterStateRenderDialog

FlutterStateRenderDialog is a library that provides a set of customizable dialogs for rendering
different states in a Flutter application, such as loading, error, and success states.

## Installation

To use FlutterStateRenderDialog, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_state_render_dialog: ^1.0.5
```


## Asset Setup

In order to use FlutterStateRenderDialog, you need to add the required JSON assets to your project.
1- Create a folder named assets in the root of your Flutter project.
2- Inside the assets folder, create another folder named json.
3- Place the following JSON files inside the json folder:
- `loading.json`
- `error.json`
- `success.json`
Here's an example directory structure:
```
your_flutter_project/
├── lib/
├── assets/
│   └── json/
│       ├── loading.json
│       ├── error.json
│       └── success.json
└── pubspec.yaml
```

Make sure to update the pubspec.yaml file of your project to include the assets:

```
flutter:
  assets:
    - assets/json/loading.json
    - assets/json/error.json
    - assets/json/success.json
```

## Usage

Import the package in your Dart file:

```
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
```

Use the `dialogRender` function to show the state render dialog:

```
dialogRender(
  context: context,
  stateRenderType: StateRenderType.popUpLoadingState,
  message: 'Loading...',
);
```

## StateRenderType

The `StateRenderType` enum defines the different types of state render dialogs available:

`popUpLoadingState`: Displays a loading state dialog.
`popUpErrorState`: Displays an error state dialog.
`popUpSuccessState`: Displays a success state dialog.

## Customization
You can customize the appearance of the dialogs by modifying the colors, fonts, and animations used. The package provides default styles, but you can override them to match your app's design.

## Examples
Show a Loading State Dialog
```
dialogRender(
  context: context,
  stateRenderType: StateRenderType.popUpLoadingState,
  message: 'Loading...',
);
```
Show an Error State Dialog
```
dialogRender(
  context: context,
  stateRenderType: StateRenderType.popUpErrorState,
  message: 'An error occurred.',
  retryAction: () {
    // Retry action logic here
  },
);
```
Show a Success State Dialog
```
dialogRender(
  context: context,
  stateRenderType: StateRenderType.popUpSuccessState,
  title: 'Success',
  message: 'Operation completed successfully.',
  child: ElevatedButton(
    onPressed: () {
      // Button action logic here
    },
    child: Text('Continue'),
  ),
);
```

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please
feel free to open an issue or submit a pull request on the GitHub repository.

## License

This library is released under the MIT License.
