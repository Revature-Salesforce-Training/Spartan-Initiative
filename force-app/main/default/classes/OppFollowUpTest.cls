/* Author: Trenton Teasdale
  Last Modified: 6/7/22
	Test for platform event
*/

@isTest
public class OppFollowUpTest {
    @isTest static void test(){
            Date dueDate = (Date.today())+7;
        Opp_FollowUp__e opp = new Opp_FollowUp__e(
            New_Opp__c = true,
            Follow_Up_Date__c = dueDate);
        Test.startTest();
       	Database.SaveResult sr = EventBus.publish(opp);
        Test.stopTest();
        
        System.assertEquals(true, sr.isSuccess());
        
        List<Task> tasks = [SELECT Id FROM Task];
        System.assertEquals(1, tasks.size());
}
}