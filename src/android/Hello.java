package com.example.plugin;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;
import android.util.Log;
import android.content.Context;
import android.content.res.Configuration;

public class Hello extends CordovaPlugin {

	public boolean isTablet(Context context) {
		return (context.getResources().getConfiguration().screenLayout
				& Configuration.SCREENLAYOUT_SIZE_MASK)
			>= Configuration.SCREENLAYOUT_SIZE_LARGE;
	}

    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {

		Context context = this.cordova.getActivity().getApplicationContext(); 
		Log.v("PLUGIN", "action: " + action);

        if (action.equals("show")) 
		{
            String name = data.getString(0);
            String message = "Hello, " + name;
            callbackContext.success(message);
            return true;
		}
		else if (action.equals("isTablet")) 
		{
            callbackContext.success(isTablet(context) ? "true" : "false");
			return true;
		}
		else if (action.equals("isPhone")) 
		{
            callbackContext.success(isTablet(context) ? "false" : "true");
			return true;
        }
		else 
		{
            return false;
        }
    }
}
