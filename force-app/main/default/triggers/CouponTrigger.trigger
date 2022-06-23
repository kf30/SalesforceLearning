trigger CouponTrigger on Coupon__c (before insert, before update) {

	
    CouponTriggerHandler copTrigger = new CouponTriggerHandler();
    copTrigger.insertCheckCoupons(Trigger.new);
    copTrigger.updateCoupons(Trigger.new);    

    
}