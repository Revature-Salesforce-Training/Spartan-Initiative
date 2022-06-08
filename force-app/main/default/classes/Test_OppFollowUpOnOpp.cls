// Test_OppFollowUpOnOpp
// Matt McCain
// Created on 6/7/22
// Modified on 6/7/22

@isTest
public class Test_OppFollowUpOnOpp {

    @isTest
    public static void test() {
        Opportunity opp = new Opportunity();
        opp.CloseDate = date.today().addMonths(2);
        opp.Name = 'test opp';
        opp.StageName = 'IsWon';
        List<Opportunity> oppList = new List<Opportunity>();
        oppList.add(opp);
        Test.startTest();
        OppFollowUpOnOpp_Helper.createEvent(oppList);
        Test.stopTest();
        System.assert([SELECT COUNT() FROM Opportunity] > 0);
    }
}