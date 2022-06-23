public class CouponTriggerHandler {
    //public class CouponException extends Exception{}
    //Insert
    set<String> setEmployeeIDs = new set<String>();
    public void insertCheckCoupons(list<Coupon__c> listCoupons){
        for(Coupon__c coup:listCoupons){

            if(coup.EmployeeID__c!='' && coup.EmployeeID__c!=null && (coup.Status__c=='Valid' || coup.Status__c=='Expired')){
                setEmployeeIDs.add(coup.EmployeeID__c);
            
        	}
            else{
                coup.addError('invalid record');
            }
		}
    }
    public void updateCoupons(list<Coupon__c> listCoupons){
        for(Coupon__c cp:listCoupons)
        {
            Integer cnt = [Select count() from Coupon__c where EmployeeID__c =: cp.EmployeeID__c AND Status__c='Valid'];
            if(cnt>=2 && cp.Status__c=='Valid')
            {
                cp.addError('Employee should not have more then 2 active coupons');
            }
            else{
                if((cp.Status__c =='Valid' || cp.Status__c=='Expired') && cp.Status__c!=null && cp.Status__c!=''){
                    setEmployeeIDs.add(cp.EmployeeID__c);
                }
                else{
                    cp.addError('Status field value is invalid');
                }
                
            }
           //update cp;  
            
        }
    }
}