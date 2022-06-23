@RestResource(urlMapping='/CouponsManager/*')
global with sharing class CouponsManager {
    //This is Post Method
    @HttpPost
    global static ID createCoupon(Decimal Amount, String Status, String IssueDate, String ExpiryDate,
                                  String RedeemedDate, String Brand, String cas){

                RestResponse response=RestContext.response; 
                //HttpResponse hres=new HttpResponse();
                Coupon__c newCoupon = new Coupon__c(
            					Amount__c = Amount,
        						Status__c = Status,
            					Issue_Date__c = Date.parse(IssueDate),
            					Expiry_Date__c = Date.parse(ExpiryDate),
            					Redeemed_Date__c = Date.parse(RedeemedDate),
          						Brand__c = Brand);
       
        insert newCoupon;
        return newCoupon.id;
}
    
    
    
    
    //This is get Method
    
/*    
    @HttpGet
    global static Coupon__c getCouponById(){
        
        RestRequest request=RestContext.request;
		RestResponse response=RestContext.response;
		String jsonString=request.requestBody.toString().trim();
        Coupon__c couponReq= (Coupon__c)JSON.deserializeStrict(jsonString, Coupon__c.class);
        
        if(couponReq !=NULL)
        {

			Coupon__c cop = [SELECT Coupon_Code__c,Status__c,Amount__c,Brand__c,Issue_Date__c,Expiry_Date__c FROM Coupon__c];
			// Coupon__c cop=[SELECT Coupon_Code__c,Status__c,Amount__c,Brand__c,IssueDate__c,ExpiryDate__c FROM Coupon__c
			// WHERE Id= :copuponReq];

}
        
        String coupId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Coupon__c coup = [SELECT Amount__c, Status__c, Issue_Date__c, Expiry_Date__c,Redeemed_Date__c, Case__c,
                          Brand__c FROM Coupon__c WHERE Id = :coupId];
        return coup;
    } 
*/

}