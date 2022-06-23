import { LightningElement, wire } from 'lwc';


export default class TestLWC extends LightningElement {
    
    generateCoupon(){
        
            fetch('/services/apexrest/Coupon__c/CreateCopDetails',{'IssueDate' :  'Date.today', 
        'Amount' : 'Case.Replacement_Value__c', 'Status' : 'Active', 'Case' : 'Case.Id'});
            
        
        console.log("in if");
        document.write("in if");
    }
    resendCouponCode(){
        /*
        dataURL;
        fetch('/services/apexrest/Coupon__c/getCouponId',{method:"GET"})
        .then((response) => response.json())
        .then((data) => {
            console.log("data" : data);
            this.dataURL = data[0].url;
        });
        */
    }
}