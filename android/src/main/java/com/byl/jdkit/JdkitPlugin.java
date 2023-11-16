package com.byl.jdkit;

import android.app.Application;
import android.content.Context;
import android.util.Log;

import androidx.annotation.NonNull;

import com.jd.jdsdk.JdHelper;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * JdkitPlugin
 */
public class JdkitPlugin implements FlutterPlugin, MethodCallHandler {
    Context context;
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        context = flutterPluginBinding.getApplicationContext();
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "jdkit");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("init")) {
            Map<String, String> map = (Map<String, String>) call.arguments;
            JdHelper.init((Application) context, map.get("appKey"), map.get("appSecretKey"), ((success, error) -> {
                result.success(success ? getResult(0) : getResult(-1, error));
            }));
        } else if (call.method.equals("openJDUrl")) {
            Map<String, Object> map = (Map<String, Object>) call.arguments;
            JdHelper.openJDUrl((Application) context, map, ((state, error) -> {
                Log.e("Jdkit", state + "," + error);
                try {
                    result.success(getResult(state, error));
                } catch (Exception e) {

                }
            }));
        } else if (call.method.equals("openJXUrl")) {
            Map<String, Object> map = (Map<String, Object>) call.arguments;
            JdHelper.openJXUrl((Application) context, map, ((state, error) -> {
                Log.e("Jdkit", state + "," + error);
                try {
                    result.success(getResult(state, error));
                } catch (Exception e) {

                }
            }));
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    Map<String, Object> getResult(int code) {
        Map<String, Object> map = new HashMap<>();
        map.put("code", code);
        return map;
    }

    Map<String, Object> getResult(int code, Object msg) {
        Map<String, Object> map = new HashMap<>();
        map.put("code", code);
        map.put("msg", msg);
        return map;
    }
}
