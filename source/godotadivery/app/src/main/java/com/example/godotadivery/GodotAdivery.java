package com.example.godotadivery;

import android.util.Log;

import org.godotengine.godot.BuildConfig;
import org.godotengine.godot.Godot;
import org.godotengine.godot.plugin.GodotPlugin;
import org.godotengine.godot.plugin.SignalInfo;
import org.godotengine.godot.plugin.UsedByGodot;

import com.adivery.sdk.Adivery;
import com.adivery.sdk.AdiveryListener;

import java.util.HashSet;
import java.util.Set;

public class GodotAdivery extends GodotPlugin {
    String TAG = "godot";
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
        return signals;
    }

    @UsedByGodot
    public void configure(String app_id) {
        Adivery.configure(getGodot().getActivity().getApplication(),app_id);
        if (BuildConfig.DEBUG)
            Log.d(TAG, "configure: " + app_id);
    }
    @UsedByGodot
    public void show_log() {
        Adivery.addGlobalListener(new AdiveryListener() {
            public void log(String placementId, String message) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "log: " + placementId +" " + message);
                emitSignal("_on_log",placementId,message);
            }
        });
    }
    @UsedByGodot
    public void prepare_interstitial_ad(String placement_id) {
        Adivery.prepareInterstitialAd(getGodot().getActivity().getApplication(),placement_id);
        Adivery.addGlobalListener(new AdiveryListener() {
            @Override
            public void onInterstitialAdLoaded(String placementId) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onInterstitialAdLoaded: " + placementId);
                emitSignal("_on_interstitial_ad_loaded",placementId);
            }
            public void onInterstitialAdShown(String placementId) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onInterstitialAdShown: " + placementId);
                emitSignal("_on_interstitial_ad_shown",placementId);
            }
            public void onInterstitialAdClicked(String placementId) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onInterstitialAdClicked: " + placementId);
                emitSignal("_on_interstitial_ad_clicked",placementId);
            }
            public void onInterstitialAdClosed(String placementId) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onInterstitialAdClosed: " + placementId);
                emitSignal("_on_interstitial_ad_closed",placementId);
            }
        });
    }
    @UsedByGodot
    public void request_rewarded_ad(String placement_id) {
        Adivery.prepareRewardedAd(getGodot().getActivity().getApplication(),placement_id);
        Adivery.addGlobalListener(new AdiveryListener() {
            public void onRewardedAdLoaded(String placementId) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onRewardedAdLoaded: " + placementId);
                emitSignal("_on_rewarded_ad_loaded",placementId);
            }
            public void onRewardedAdShown(String placementId) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onRewardedAdShown: " + placementId);
                emitSignal("_on_rewarded_ad_shown",placementId);
            }
            public void onRewardedAdClicked(String placementId) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onRewardedAdClicked: " + placementId);
                emitSignal("_on_rewarded_ad_clicked",placementId);
            }
            public void onRewardedAdClosed(String placementId, boolean isRewarded) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onRewardedAdClosed: " + placement_id + "isRewarded: " +isRewarded);
                emitSignal("_on_rewarded_ad_closed",placementId,isRewarded);
            }
        });
    }
    @UsedByGodot
    public void prepare_app_open_dd(String placement_id) {
        Adivery.prepareAppOpenAd(getGodot().getActivity(),placement_id);
        Adivery.addGlobalListener(new AdiveryListener() {
            public void onAppOpenAdLoaded(String placementId) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onAppOpenAdLoaded: " + placementId);
                emitSignal("_on_app_open_ad_loaded",placementId);
            }
            public void onAppOpenAdClosed(String placementId) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onAppOpenAdClosed: " + placementId);
                emitSignal("_on_app_open_ad_closed",placementId);
            }
            public void onAppOpenAdClicked(String placementId) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onAppOpenAdClicked: " + placementId);
                emitSignal("_on_app_open_ad_clicked",placementId);
            }
            public void onAppOpenAdShown(String placementId) {
                if (BuildConfig.DEBUG)
                    Log.d(TAG, "onAppOpenAdShown: " + placementId);
                emitSignal("_on_app_open_ad_shown",placementId);
            }
        });
    }
//    @UsedByGodot
//    public Boolean is_loaded(String placement_id) {
//        if (BuildConfig.DEBUG)
//            Log.d(TAG, "is_loaded: " + placement_id);
//        return Adivery.isLoaded(placement_id);
//    }
    @UsedByGodot
    public void show_ad(String placement_id) {
        if (Adivery.isLoaded(placement_id)) {
            if (BuildConfig.DEBUG)
                Log.d(TAG, "show_ad: " + placement_id);
            Adivery.showAd(placement_id);
        }
    }
    @UsedByGodot
    public void show_app_open_ad(String placement_id) {
        if (Adivery.isLoaded(placement_id)) {
            if (BuildConfig.DEBUG)
                Log.d(TAG, "show_app_open_ad: " + placement_id);
            Adivery.showAppOpenAd(getGodot().getActivity(), placement_id);
        }
    }
}
