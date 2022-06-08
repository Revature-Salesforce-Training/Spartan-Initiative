/* Author: Trenton Teasdale
  Last Modified: 6/7/22
	trigger for platform events
*/

trigger OppFollowUp on Opp_FollowUp__e (after insert) {
	List<task> tsk = new List<task>();
    for(Opp_FollowUp__e event : Trigger.New) {
        if(event.New_Opp__c == true){
            Task t = new Task();
            t.Subject = '1 Week Follow Up';
            Date myDate = (Date.today())+7;
            t.ActivityDate = myDate;
            t.OwnerId = Event.CreatedById;
            tsk.add(t);
}
}
    insert tsk;
}