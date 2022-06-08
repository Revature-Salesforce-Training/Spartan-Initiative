//TriggerOnAccount.apxt
//Samir Kalouf
//Created Date: 06-06-2022
//Modified Date: 06-07-2022
//This trigger listens for a lead before the save where it will call on the TriggerOnAccountHelper class. 
trigger TriggerOnAccount on Account (before insert) {
            TriggerOnAccountHelper.myTriggerMethod(Trigger.new);
}