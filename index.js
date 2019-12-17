import { NativeModules } from 'react-native';

const { BioMod } = NativeModules

export default {
  sampleMethod: (strArg, numPar) => {
    return BioMod.sampleMethod(strArg, numPar)
  }
}
