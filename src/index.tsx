import { NativeModules } from 'react-native';

type AppInstallDateType = {
  getDateTime(format: string): Promise<string>;
};

const { AppInstallDate } = NativeModules;

export default AppInstallDate as AppInstallDateType;
