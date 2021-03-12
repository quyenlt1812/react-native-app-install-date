package com.reactnativeappinstalldate

import android.content.pm.PackageManager
import android.text.format.DateFormat

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import java.util.*

class AppInstallDateModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "AppInstallDate"
    }

    // Example method
    // See https://reactnative.dev/docs/native-modules-android
    @ReactMethod
    fun multiply(a: Int, b: Int, promise: Promise) {

      try{
            var installedTime: Long = reactApplicationContext.getPackageManager().getPackageInfo(reactApplicationContext.getPackageName(),0).firstInstallTime;

            var dateString: String = DateFormat.format("MM/dd/yyyy hh:mm:ss", Date(installedTime)).toString();

            promise.resolve(dateString)
        }catch(e: PackageManager.NameNotFoundException){
            e.printStackTrace();
        }



    }


}
