package com.example.godotadivery;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;

import org.godotengine.godot.Godot;
import org.godotengine.godot.plugin.GodotPlugin;
import org.godotengine.godot.plugin.SignalInfo;
import org.godotengine.godot.plugin.UsedByGodot;
import org.jetbrains.annotations.NotNull;

import com.adivery.sdk.Adivery;
import com.adivery.sdk.AdiveryAdListener;
import com.adivery.sdk.AdiveryBannerAdView;
import com.adivery.sdk.AdiveryListener;
import com.adivery.sdk.AdiveryNativeCallback;
import com.adivery.sdk.BannerSize;
import com.adivery.sdk.NativeAd;
import com.adivery.sdk.networks.adivery.AdiveryNativeAd;

import java.io.ByteArrayOutputStream;
import android.util.Base64;
import java.util.Dictionary;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Set;
import java.util.concurrent.TimeUnit;

public class GodotAdivery extends GodotPlugin {
    private Dictionary<String,AdiveryBannerAdView> bannerAd = new Hashtable<>();
    private Dictionary<String,AdiveryNativeAd> nativeAd = new Hashtable<>();
    public GodotAdivery(Godot godot) {
        super(godot);
    }
    @Override
    public String getPluginName() {
        return "GodotAdivery";
    }

    @Override
    public Set<SignalInfo> getPluginSignals() {
        Set<SignalInfo> signals = new HashSet<>();
        signals.add(new SignalInfo("_on_log", String.class, String.class));
        signals.add(new SignalInfo("_on_interstitial_ad_loaded", String.class));
        signals.add(new SignalInfo("_on_interstitial_ad_shown", String.class));
        signals.add(new SignalInfo("_on_interstitial_ad_clicked", String.class));
        signals.add(new SignalInfo("_on_interstitial_ad_closed", String.class));
        signals.add(new SignalInfo("_on_rewarded_ad_loaded", String.class));
        signals.add(new SignalInfo("_on_rewarded_ad_shown", String.class));
        signals.add(new SignalInfo("_on_rewarded_ad_clicked", String.class));
        signals.add(new SignalInfo("_on_rewarded_ad_closed", String.class, Boolean.class));
        signals.add(new SignalInfo("_on_app_open_ad_loaded", String.class));
        signals.add(new SignalInfo("_on_app_open_ad_closed", String.class));
        signals.add(new SignalInfo("_on_app_open_ad_clicked", String.class));
        signals.add(new SignalInfo("_on_app_open_ad_shown", String.class));
        signals.add(new SignalInfo("_on_banner_ad_clicked", String.class));
        signals.add(new SignalInfo("_on_banner_ad_error", String.class, String.class));
        signals.add(new SignalInfo("_on_banner_ad_loaded", String.class));
        signals.add(new SignalInfo("_on_native_ad_loaded", String.class, org.godotengine.godot.Dictionary.class));
        signals.add(new SignalInfo("_on_native_ad_shown", String.class));
        signals.add(new SignalInfo("_on_native_ad_shown_failed", String.class));
        signals.add(new SignalInfo("_on_native_ad_clicked", String.class));
        signals.add(new SignalInfo("_on_native_ad_load_failed", String.class));
        return signals;
    }

    @UsedByGodot
    public void configure(String app_id) {
        Adivery.configure(getGodot().getActivity().getApplication(),app_id);
    }
    @UsedByGodot
    public void show_log() {
        Adivery.addGlobalListener(new AdiveryListener() {
            public void log(String placementId, String message) {
                emitSignal("_on_log",placementId,message);
            }
        });
    }
    @UsedByGodot
    public void prepare_interstitial_ad(String placement_id) {
        Adivery.prepareInterstitialAd(getActivity(),placement_id);
        Adivery.addGlobalListener(new AdiveryListener() {
            @Override
            public void onInterstitialAdLoaded(String placementId) {
                emitSignal("_on_interstitial_ad_loaded",placementId);
            }
            public void onInterstitialAdShown(String placementId) {
                emitSignal("_on_interstitial_ad_shown",placementId);
            }
            public void onInterstitialAdClicked(String placementId) {
                emitSignal("_on_interstitial_ad_clicked",placementId);
            }
            public void onInterstitialAdClosed(String placementId) {
                emitSignal("_on_interstitial_ad_closed",placementId);
            }
        });
    }
    @UsedByGodot
    public void request_rewarded_ad(String placement_id) {
        Adivery.prepareRewardedAd(getActivity(),placement_id);
        Adivery.addGlobalListener(new AdiveryListener() {
            public void onRewardedAdLoaded(String placementId) {
                emitSignal("_on_rewarded_ad_loaded",placementId);
            }
            public void onRewardedAdShown(String placementId) {
                emitSignal("_on_rewarded_ad_shown",placementId);
            }
            public void onRewardedAdClicked(String placementId) {
                emitSignal("_on_rewarded_ad_clicked",placementId);
            }
            public void onRewardedAdClosed(String placementId, boolean isRewarded) {
                emitSignal("_on_rewarded_ad_closed",placementId,isRewarded);
            }
        });
    }
    @UsedByGodot
    public void prepare_app_open_ad(String placement_id) {
        Adivery.prepareAppOpenAd(getActivity(),placement_id);
        Adivery.addGlobalListener(new AdiveryListener() {
            public void onAppOpenAdLoaded(String placementId) {
                emitSignal("_on_app_open_ad_loaded",placementId);
            }
            public void onAppOpenAdClosed(String placementId) {
                emitSignal("_on_app_open_ad_closed",placementId);
            }
            public void onAppOpenAdClicked(String placementId) {
                emitSignal("_on_app_open_ad_clicked",placementId);
            }
            public void onAppOpenAdShown(String placementId) {
                emitSignal("_on_app_open_ad_shown",placementId);
            }
        });
    }
    @UsedByGodot
    public void prepare_banner_ad(String placement_id, boolean retry_on_error) {
        AdiveryBannerAdView bannerAdView = new AdiveryBannerAdView(getActivity());
        bannerAdView.setPlacementId(placement_id);
        bannerAdView.setRetryOnError(retry_on_error);
        bannerAd.put(placement_id, bannerAdView);
        bannerAdView.setBannerAdListener(new AdiveryAdListener() {
            @Override
            public void onAdLoaded() {
                emitSignal("_on_banner_ad_loaded", placement_id);
            }
            @Override
            public void onError(String reason) {
                emitSignal("_on_banner_ad_error", placement_id, reason);
            }
            @Override
            public void onAdClicked() {
                emitSignal("_on_banner_ad_clicked", placement_id);
            }
        });
    }
    @UsedByGodot
    public void set_banner_size(String placement_id, int size) {
        AdiveryBannerAdView bannerAdView = bannerAd.get(placement_id);
        int width = 0;
        int height = 0;
        switch (size) {
            case 1 -> {
                width = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 320, getActivity().getResources().getDisplayMetrics());
                height = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 50, getActivity().getResources().getDisplayMetrics());
                bannerAdView.setBannerSize(BannerSize.BANNER);
            }
            case 2 -> {
                width = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 320, getActivity().getResources().getDisplayMetrics());
                height = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 100, getActivity().getResources().getDisplayMetrics());
                bannerAdView.setBannerSize(BannerSize.LARGE_BANNER);
            }
            case 3 -> {
                width = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 300, getActivity().getResources().getDisplayMetrics());
                height = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 250, getActivity().getResources().getDisplayMetrics());
                bannerAdView.setBannerSize(BannerSize.MEDIUM_RECTANGLE);
            }
        }
        int finalWidth = width;
        int finalHeight = height;
        getGodot().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                getActivity().addContentView(bannerAdView,new ViewGroup.LayoutParams(finalWidth, finalHeight));
            }
        });
    }
    @UsedByGodot
    public void set_banner_position(String placement_id, float x, float y) {
        AdiveryBannerAdView bannerAdView = bannerAd.get(placement_id);
        bannerAdView.setX(x);
        bannerAdView.setY(y);
    }
    @UsedByGodot
    public void load_banner_ad(String placement_id) {
        AdiveryBannerAdView bannerAdView = bannerAd.get(placement_id);
        bannerAdView.loadAd();
    }
    @UsedByGodot
    public void set_visibility(String placement_id, boolean visibility) {
        getGodot().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                AdiveryBannerAdView bannerAdView = bannerAd.get(placement_id);
                if (visibility) {
                    bannerAdView.setVisibility(View.VISIBLE);
                } else {
                    bannerAdView.setVisibility(View.INVISIBLE);
                }
            }
        });

    }
    @UsedByGodot
    public void close_banner(String placement_id) {
        getGodot().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                AdiveryBannerAdView bannerAdView = bannerAd.get(placement_id);
                ViewGroup viewGroup = (ViewGroup)(bannerAdView.getParent());
                viewGroup.removeView(bannerAdView);
            }
        });
    }
    @UsedByGodot
    public void show_ad(String placement_id) {
        if (Adivery.isLoaded(placement_id)) {
            Adivery.showAd(placement_id);
        }
    }
    @UsedByGodot
    public void show_app_open_ad(String placement_id) {
        if (Adivery.isLoaded(placement_id)) {
            getGodot().runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Adivery.showAppOpenAd(getGodot().getActivity(), placement_id);
                }
            });
        }
    }
    @UsedByGodot
    public boolean is_loaded(String placement_id) {
        boolean result = false;
        result = Adivery.isLoaded(placement_id);
        return result;
    }
    @UsedByGodot
    public void request_native_ad(String placement_id) {
        Adivery.requestNativeAd(getActivity(), placement_id, new AdiveryNativeCallback() {
            @Override
            public void onAdLoadFailed(@NotNull String reason) {
                emitSignal("_on_native_ad_load_failed", placement_id);
            }

            @Override
            public void onAdClicked() {
                emitSignal("_on_native_ad_clicked", placement_id);
            }

            @Override
            public void onAdLoaded(@NotNull NativeAd ad) {
                org.godotengine.godot.Dictionary result = new org.godotengine.godot.Dictionary();
                org.godotengine.godot.Dictionary media_content = new org.godotengine.godot.Dictionary();
                AdiveryNativeAd adiveryNativeAd = (AdiveryNativeAd) ad;
                nativeAd.put(placement_id, adiveryNativeAd);
                result.put("advertiser", adiveryNativeAd.getAdvertiser());
                result.put("description", adiveryNativeAd.getDescription());
                Drawable iconD = adiveryNativeAd.getIcon();
                Bitmap iconB = drawableToBitmap(iconD);
                result.put("icon", encodeToBase64(iconB));
                result.put("icon_url", adiveryNativeAd.getIconUrl());
                result.put("head_line", adiveryNativeAd.getHeadline());
                Drawable imageD = adiveryNativeAd.getImage();
                Bitmap imageB = drawableToBitmap(imageD);
                result.put("image", encodeToBase64(imageB));
                result.put("image_url", adiveryNativeAd.getImageUrl());
                result.put("call_to_action", adiveryNativeAd.getCallToAction());
                emitSignal("_on_native_ad_loaded", placement_id, result);
            }
            @Override
            public void onAdShowFailed(@NotNull String reason) {
                emitSignal("_on_native_ad_shown_failed", placement_id);
            }
            @Override
            public void onAdShown() {
                emitSignal("_on_native_ad_shown", placement_id);
            }
        });
    }
    @UsedByGodot
    public void record_click(String placement_id) {
        AdiveryNativeAd adiveryNativeAd = (AdiveryNativeAd) nativeAd.get(placement_id);
        adiveryNativeAd.recordClick();
    }
    @UsedByGodot
    public void record_impression(String placement_id) {
        AdiveryNativeAd adiveryNativeAd = (AdiveryNativeAd) nativeAd.get(placement_id);
        adiveryNativeAd.recordImpression();
    }

    @UsedByGodot
    public void set_user_id(String user_id) {
        Adivery.setUserId(user_id);
    }
    public String encodeToBase64(Bitmap bitmap) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream .toByteArray();
        String encoded = Base64.encodeToString(byteArray, Base64.DEFAULT);
        return encoded;
    }
    public static Bitmap drawableToBitmap (Drawable drawable) {
        Bitmap bitmap = null;
        if (drawable instanceof BitmapDrawable) {
            BitmapDrawable bitmapDrawable = (BitmapDrawable) drawable;
            if(bitmapDrawable.getBitmap() != null) {
                return bitmapDrawable.getBitmap();
            }
        }
        if(drawable.getIntrinsicWidth() <= 0 || drawable.getIntrinsicHeight() <= 0) {
            bitmap = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888); // Single color bitmap will be created of 1x1 pixel
        } else {
            bitmap = Bitmap.createBitmap(drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
        }
        Canvas canvas = new Canvas(bitmap);
        drawable.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
        drawable.draw(canvas);
        return bitmap;
    }
    public String i_placement_id = "";
    public boolean show_on_resume = false;
    private long lastPauseTime = 0L;
    @UsedByGodot
    public void set_show_on_resume(boolean value) {
        show_on_resume = value;
    }
    @UsedByGodot
    public void set_i_placement_id(String value) {
        i_placement_id = value;
    }

    @Override
    public void onMainPause() {
        super.onMainPause();
        if (show_on_resume) {
            lastPauseTime = System.currentTimeMillis();
        }
    }

    @Override
    public void onMainResume() {
        super.onMainResume();
        if (show_on_resume) {
            long pauseTime = System.currentTimeMillis() - lastPauseTime;
            if (pauseTime > TimeUnit.SECONDS.toMillis(5)) {
                show_app_open_ad(i_placement_id);
            }
        }
    }
}
