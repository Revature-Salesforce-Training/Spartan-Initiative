/**
*Reis Taylor
*Last Modified: 6/7
*100% Code Coverage
*See comments in CaseTrigger
 */

@isTest
public class CaseTriggerTest {
 
   @isTest static void newCase() {
        Test.startTest();
        Case kase = new Case();
        kase.Status = 'working';
        kase.Origin = 'web';
        kase.Product_Purchase_Date__c        = Date.today();
        kase.Product_Total_Warranty_Days__c  = 90; 
        insert kase;
       Test.stopTest();
    }
}
