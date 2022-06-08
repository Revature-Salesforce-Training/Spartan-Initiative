//File Name: Congratulations Lead Test
//Author: Louis
//Created:6/7/2022
//modified: 6/7/2022
// This program is designed to Test the Trigger

@isTest

public class messageLeadTest {
    @isTest
    public static void messageTestMethod(){
        
        //gives us the new lead info
        Lead l = new Lead();
        
        l.FirstName='firstName';
        l.LastName='lastName';
        l.Company = 'fake company';
        test.startTest();
        
        insert l;
        
        test.stopTest();
        
        Lead Test = [SELECT Message__c FROM Lead];
        System.assertEquals('Congratulations on new Lead', Test.Message__c);
 
       // string message = l.Message__c;
        
    }

}