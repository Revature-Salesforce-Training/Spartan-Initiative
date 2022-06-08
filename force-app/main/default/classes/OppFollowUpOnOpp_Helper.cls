// OppFollowUpOnOpp_Helper
// Matt McCain
// Created Date 6/7/22
// Modified Date 6/7/22
// This Helper sets a follow up date and
// publishes the Opportunity Event


public class OppFollowUpOnOpp_Helper {

    public OppFollowUpOnOpp_Helper() {

    }

    public static void createEvent(List<Opportunity> oppList) {
        for (Opportunity opp : oppList) {

            Date dueDate = (Date.today()+7);
            Opp_FollowUp__e oppFollow = new Opp_FollowUp__e(
            New_Opp__c = true,
            Follow_Up_Date__c = dueDate);
            Eventbus.publish(oppFollow);
        }
    }
}