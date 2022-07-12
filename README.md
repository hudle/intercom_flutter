# intercom_flutter

Flutter plugin for Intercom made with the use case for Hudle Organization.

## Add Dependency

     dependencies:
        intercom_flutter:
            git:
                url: https://github.com/hudle/intercom_flutter


## Create Intercom Instance

```dart
    final _intercomFlutterPlugin = IntercomFlutter();
```

## Methods

1. Initialize
```dart
_intercomFlutterPlugin.initialize(apiKey: API_KEY , appId: APP_ID);
```

2. Register User

```dart
_intercomFlutterPlugin.registerIdentifiedUser(
                        Registration(
                          userId: 'Test ID',
                          attributes: UserAttributes(name: 'Syed', phone: 'xx', email: 'syed@hudle.in'),
                        ),
                      );
```

3. Log Event

```dart
_intercomFlutterPlugin.logEvent('Test Event Flutter', {'platform': Platform.isAndroid ? 'Android' : 'IOS'},);
```

4. Logout

```dart
_intercomFlutterPlugin.logout();
```


## Platform

``Ios``
``Android``


## IOS Installation

Make sure that you have a NSPhotoLibraryUsageDescription entry in your Info.plist.

``<key>NSPhotoLibraryUsageDescription</key>
<true/>``


## Android Installtion

<b>Required Permission</b>

    <uses-permission android:name="android.permission.INTERNET"/>

<b>Optional Permissions</b>
        
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.VIBRATE"/>
