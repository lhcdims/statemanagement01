# statemanagement01

State Management Example 01

In a complex app, sometimes a Global Variable 'attached' to a widget, can be changed by some 'EXTERNAL EVENT' such as (1) A timer that run in another thread, or (2) socket.io server emit event (3) Others ......

Let's call this global variable gintCount and the app has 3 pages, namely:

Page 1: A 'Dynamic' page that need to display the latest value of gintCount.

Page 2: Another 'Dynamic' page that need to display the latest value of gintCount, with a Text Input Field.

Page 3: A 'Static' page that do nothing when gintCount changes.


Suppose the user is doing something in Page 1 or Page 2, when and where should we 'Refresh' the page to display the latest value that may/might be changed by EXTERNAL event?

I read the other Q&A in stackoverflow and it is said that there are 4 ways for the State Management of Flutter, they are namely:

Using setState

Using ScopedModal

Using Rxdart with BLoC

Using Redux


Since I'm a newbie in Flutter, I am completely lost in 2 to 4, so I've build an app using no. 1, i.e. setState. to demonstrate how we can manage states in flutter. And I hope, in the future, I am able to (or somebody else) provide answers by using no. 2 to 4.


## To create this App Manually

1. Download the zip file from github

2. Create a new Flutter App in Android Studio.

3. In file pubspec.yaml,include the following lines after dependencies:

  threading:


4. 'Tools' ->  'Flutter' -> 'Flutter Packages Get'

5. Copy all the dart files from the zip file to your 'lib' directory

6. Run the app in emulator or device.