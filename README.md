# iOS Viper Architecture: ViperDemo
This repository contains a simple example of VIPER Architectural Design Pattern

<p align="center">
  <img src="https://github.com/dduardo/ViperDemo/Images/Viper.png" width="250">
</p>
<br>
<br>

## Project Structure
Each of the letters in VIPER stand for a component of the architecture: View, Interactor, Presenter, Entity and Router.

* The View is the user interface. This corresponds to a SwiftUI View.
* The Interactor is a class that mediates between the presenter and the data. It takes direction from the presenter.
* The Presenter is the “traffic cop” of the architecture, directing data between the view and interactor, taking user actions and calling to router to move the user between views.
* An Entity represents application data.
* The Router handles navigation between screens. That’s different than it is in SwiftUI, where the view shows any new views.
