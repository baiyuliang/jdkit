
@[TOC](目录)

文档地址：[https://baiyuliang.blog.csdn.net/article/details/134444104](https://baiyuliang.blog.csdn.net/article/details/134444104)

京东联盟flutter插件地址：[https://pub.dev/packages/jdkit](https://pub.dev/packages/jdkit)

![在这里插入图片描述](https://img-blog.csdnimg.cn/d8d40569a2634f33986bc2c3709066a5.png)

# 1.京东联盟官网注册申请步骤略~
# 2.安卓端插件配置：

1）将申请的安全图片，safe.jpg放在flutter项目，android主工程res/raw下：

![在这里插入图片描述](https://img-blog.csdnimg.cn/f3a2f3063b5b4222a47679b550c6fd03.png)

2）从github上，将jdsdk文件夹下载下来，并放入anrdoid主工程下：

![在这里插入图片描述](https://img-blog.csdnimg.cn/f3c8faf0d7014aa280269d1b5045389a.png)

3）修改jdsdk中的AndroidMainfest.xml：

```xml
  <activity
      android:name="com.kepler.jd.sdk.KeplerBackActivity"
      android:exported="true"
      android:theme="@android:style/Theme.Translucent">
      <intent-filter>
          <action android:name="android.intent.action.VIEW" />
          <category android:name="android.intent.category.DEFAULT" />
          <data android:scheme="sdkback49d5d16d4f8ba1411c2c1533c2308a47" />
      </intent-filter>
  </activity>
```

将scheme：sdkback后的key修改为自己的！

4）android主工程 settings.gradle中添加：`include ':jdsdk'`




# 3.IOS端插件配置

1）将申请的安全图片safe.jpg，放入IOS主工程Runner/bundle文件夹下：

![在这里插入图片描述](https://img-blog.csdnimg.cn/920ae080496144e3be02029f243a0bfc.png)
# 4.其它配置

其它配置，请按京东联盟官方文档进行配置！