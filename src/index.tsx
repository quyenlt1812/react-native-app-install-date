import { NativeModules } from 'react-native';

type AppInstallDateType = {
  multiply(a: number, b: number): Promise<number>;
};

const { AppInstallDate } = NativeModules;

export default AppInstallDate as AppInstallDateType;
