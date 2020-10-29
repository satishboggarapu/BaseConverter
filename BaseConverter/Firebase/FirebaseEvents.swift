
import FirebaseCore
import FirebaseAnalytics

public class LogKey {
    // Ads
    public static let AD_LOADED = "my_ad_loaded"
    public static let AD_CLICK = "my_ad_click"
    public static let AD_FAILED_TO_LOAD = "ad_failed_to_load"
    
    // In app reviews
    public static let REQUESTED_APP_REVIEW = "requested_app_review"
    
    // App Operations
    public static let NUMBER_ADDED_TO_OPERATION = "number_added_to_operation"
    public static let ACTIVE_BASE = "active_base"
}

public class FirebaseEvents {
    
    init() { }
    
    // ADS
    public func logAdLoaded() {
        Analytics.logEvent(LogKey.AD_LOADED, parameters: nil)
    }
    
    public func logAdClick() {
        Analytics.logEvent(LogKey.AD_CLICK, parameters: nil)
    }
    
    public func logAdFailedToLoad() {
        Analytics.logEvent(LogKey.AD_FAILED_TO_LOAD, parameters: nil)
    }
    
    // Reviews
    public func logRequestedForAppReview() {
        Analytics.logEvent(LogKey.REQUESTED_APP_REVIEW, parameters: nil)
    }
    
    // App Operations
    public func logNumberAddedToOperation() {
        Analytics.logEvent(LogKey.NUMBER_ADDED_TO_OPERATION, parameters: nil)
        let defaults = UserDefaults.standard
        let currentCount = defaults.integer(forKey: UserDefaultsKeys.totalOperations.rawValue)
        defaults.set(currentCount+1, forKey: UserDefaultsKeys.totalOperations.rawValue)
    }
    
    public func logActiveBase(base: String) {
        Analytics.logEvent(LogKey.ACTIVE_BASE, parameters: ["base": base])
    }

}
