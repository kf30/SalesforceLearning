@RestResource(urlMapping='/Coupon__c/*')
global with sharing class CouponApi {

@HttpGet
global static CouponWrapper getCouponId(){
    
    //List<Coupon__c> cop=new List<Coupon__c>();
    RestRequest request=RestContext.request;
    RestResponse response=RestContext.response;
    CouponWrapper copWrapper= new CouponWrapper();
    try{
    String jsonString=request.requestBody.toString().trim();
    /*Third party application CouponDetails*/
    CouponDetails couponReq = (CouponDetails)JSON.deserializeStrict(jsonString, CouponDetails.class);
    //String coupId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
    //string coupId='a035i000001tDNyAAM';
    if(couponReq !=NULL)
    {
        
        Coupon__c cop =  [SELECT Id,Coupon_Code__c,Status__c,Amount__c,Brand__c,Issue_Date__c,Expiry_Date__c FROM Coupon__c WHERE Coupon_Code__c=:couponReq.couponcode];
        //return cop;
        
        if(cop!=null){
            
            copWrapper.success=TRUE;
            copWrapper.Message='Success';
            Response responsewrapper=new Response();
            //responsewrapper.couponcode=Integer.parse((cc.coupon_code__c).tostring());
            responsewrapper.amount=cop.Amount__c;
            responsewrapper.status=cop.Status__c;
            responsewrapper.brand=cop.Brand__c;
            // Date dt=cc.expiry_date__c;
            responsewrapper.expirydate=cop.Expiry_Date__c;
            responsewrapper.issuedate=cop.Issue_Date__c;
            
            copWrapper.response=responsewrapper;
            response.statuscode=200;
            //response.responseBody=Blob.valueOf(JSON.serialize(copWrapper));
            //System.debug(response.responseBody);
        }
    }
    }catch(Exception e){
    copWrapper.success=False;
    copWrapper.Message='Failure';
    Response responsewrapper=new Response();
    //response.statuscode=400;
    copWrapper.response=responsewrapper;
    //response.responseBody=Blob.valueOf(JSON.serialize(copWrapper));
    
}
return copWrapper;
}
global class CouponDetails{
String couponcode;
}
global class CouponWrapper{
Boolean success{get;set;}
String message{get;set;}
Response response{get;set;}
}

global class Response{
Integer couponcode{get;set;}
String status{get;set;}
Date issuedate{get;set;}
Date expirydate{get;set;}
String brand{get;set;}
Decimal amount{get;set;}
}







@HttpPost
global static ID CreateCopDetails(Integer Coupon_Code,String Status,String Brand,
        Decimal Amount,String IssueDate,String ExpiryDate)
    {

        Coupon__c newCoupon = new Coupon__c(
        Amount__c = Amount,
        Status__c = Status,
        Issue_Date__c = Date.parse(IssueDate),
        Expiry_Date__c = Date.parse(ExpiryDate),
        //Redeemed_Date__c = Date.parse(RedeemedDate),
        Brand__c = Brand);

    insert newCoupon;
    return newCoupon.id;
}


}