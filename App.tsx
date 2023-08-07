import React from 'react';
import {View, Button, Text} from 'react-native';
import {NativeModules} from 'react-native';

const CustomModule = NativeModules.CustomModule;

const App = () => {
  const showAlertFromNativeModule = () => {
    CustomModule.showAlert('Hello from Native Module!');
  };

  const showBlueView = () => {
    console.log('CustomModule', CustomModule);
    CustomModule.showBlueView(success => {
      if (success) {
        console.log('Blue view shown successfully.');
      } else {
        console.log('Error showing blue view.');
      }
    });
  };

  return (
    <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
      <Text>Hello React Native!</Text>
      <Button title="Show Native Alert" onPress={showBlueView} />
    </View>
  );
};

export default App;
