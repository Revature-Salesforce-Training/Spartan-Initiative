//File Name: Congratulations Lead
//Author: Louis
//Created:6/7/2022
//modified: 6/7/2022
//this program is designed to trigger when a new lead is created and display a congratulations message in the Message field

trigger congradulationLead on Lead (before insert){
    for (Lead newMessage : Trigger.new){
        
      newMessage.Message__c = 'Congratulations on new Lead';
        
    }
}