package com.jd.jdsdk;

import android.app.Application;
import android.util.Log;

import com.kepler.jd.Listener.AsyncInitListener;
import com.kepler.jd.login.KeplerApiManager;
import com.kepler.jd.sdk.bean.KeplerAttachParameter;

import java.util.Iterator;
import java.util.Map;

public class JdHelper {

    public static void init(Application context, String appKey, String appSecretKey, InitCallBack initCallBack) {
        String androidId = DeviceUuidUtils.getInstance(context).getDeviceUuid();
        KeplerApiManager.asyncInitSdk(context, appKey, appSecretKey, androidId, new AsyncInitListener() {
            @Override
            public void onSuccess() {
                initCallBack.callBack(true, null);
            }

            @Override
            public void onFailure(String s) {
                initCallBack.callBack(false, s);
            }
        });
    }

    public static void openJDUrl(Application context, Map map, OpenCallBack openCallBack) {
        try {
            String url = (String) map.get("url");
            Log.e("Jdkit", "url:" + url);
            KeplerAttachParameter keplerAttachParameter = new KeplerAttachParameter();
            if (map.get("userInfo") != null) {
                Map<String, String> userInfo = (Map<String, String>) map.get("userInfo");
                Iterator iterator = userInfo.keySet().iterator();
                while (iterator.hasNext()) {
                    String key = (String) iterator.next();
                    String value = userInfo.get(key);
                    keplerAttachParameter.putKeplerAttachParameter(key, value);
                    Log.e("Jdkit", key + ":" + value);
                }
            }
            KeplerApiManager.getWebViewService().openJDUrlPage(url, keplerAttachParameter, context, (i) -> openCallBack.callBack(i, ""), 3000);
        } catch (Exception e) {
            Log.e("Jdkit", "e:" + e.getMessage());
            openCallBack.callBack(-1, e.getMessage());
        }
    }

    public static void openJXUrl(Application context, Map map, OpenCallBack openCallBack) {
        try {
            String url = (String) map.get("url");
            Log.e("Jdkit", "url:" + url);
            KeplerAttachParameter keplerAttachParameter = new KeplerAttachParameter();
            if (map.get("userInfo") != null) {
                Map<String, String> userInfo = (Map<String, String>) map.get("userInfo");
                Iterator iterator = userInfo.keySet().iterator();
                while (iterator.hasNext()) {
                    String key = (String) iterator.next();
                    String value = userInfo.get(key);
                    keplerAttachParameter.putKeplerAttachParameter(key, value);
                    Log.e("Jdkit", key + ":" + value);
                }
            }
            KeplerApiManager.getWebViewService().openJXUrlPage(url, keplerAttachParameter, context, (i) -> openCallBack.callBack(i, ""), 3000);
        } catch (Exception e) {
            Log.e("Jdkit", "e:" + e.getMessage());
            openCallBack.callBack(-1, e.getMessage());
        }
    }

    public interface InitCallBack {
        void callBack(boolean success, String error);
    }

    public interface OpenCallBack {
        void callBack(int state, String error);
    }

}
