# flutter_mvvm_boilerplate

This project is a sample for flutter MVVM pattern.

##  Features

- using [provider](https://pub.dev/packages/provider)
- using [get_it](https://pub.dev/packages/get_it)
- http: rest api

<br>

## Introduction
- The [get_it](https://pub.dev/packages/get_it) plugin was used with the [provider](https://pub.dev/packages/provider) pattern base.
- The dependency between VEIW and VEIWMODEL is `N:1` relationship.
- Contains login samples using REST API for state management.
  ![Simulator Screen Shot - iPhone 12 Pro Max](https://user-images.githubusercontent.com/26052559/130416463-edba661d-8136-4ac0-a38d-9ca00bd75b23.png)

<br>

##  Architecture
![architecture](https://user-images.githubusercontent.com/26052559/130400445-88be82ec-954b-4bac-adb0-571455127d6b.png)

<br>

## Getting Started
  1. Clone this repository
```sh
    git clone https://github.com/madsys11/flutter_mvvm_boilerplate.git
```
  2. Rename folder `flutter_mvm_boilerplate` to your project name.
  3. You can use the [rename](https://pub.dev/packages/rename) plugin to change projectName and packageName.  
```sh
    flutter pub global activate rename
    flutter pub global run rename --appname "projectName"
    flutter pub global run rename --bundleId com.xxx.packageName
```
  4. Open the project. (e.g., vscode)
  5. Use the `command+shift+h`(on mac) command to replace all `flutter_mvvm_boilerplate` to `projectName`.
  6. Get packages in a Flutter project.
```sh
    flutter pub get
```