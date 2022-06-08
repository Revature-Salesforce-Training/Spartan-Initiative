/**
* Reis Taylor
* Last Modified 6/7/2022
*/

public with sharing class CaseTrigger_Companion {
 
    public static void caseWarrantyDescription(List<Case> caseTriggerList) {

        for (Case myCase : caseTriggerList) {
                
            String caseProduct         = myCase.Product__c;
            System.debug(caseProduct);
            String purchaseDate        = myCase.Product_Purchase_Date__c.format();
            System.debug(purchaseDate);
            String createdDate         = DateTime.now().format();
            System.debug(createdDate);
            Integer warrantyDays       = myCase.Product_Total_Warranty_Days__c.intValue();

            Decimal warrantyPercentage = (100-(100*(myCase.Product_Purchase_Date__c.daysBetween(
                                        Date.today())/(myCase.Product_Total_Warranty_Days__c))))
                                        .setScale(2);
            System.debug(warrantyPercentage);
            
            myCase.Warranty_Summary__c = 'Summary of Customer Warranty: ' 
                                    + 'This case was created on ' 
                                    +  createdDate + ' '  +
                                    +  myCase.Product__c  + ' was purchased on ' 
                                    +  purchaseDate       + ', Standard Earth Time-Space.'
                                    + 'The warranty has ' + warrantyPercentage + '% power level remaining.';
        System.debug(myCase.Warranty_Summary__c);
        }        
    }

}