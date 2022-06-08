//TriggerOnAccountHelper.apxc
//Samir Kalouf
//Created Date: 06-06-2022
//Last Modified: 06-07-2022
//This class is a helper class for our trigger will populate a field before the save of an account record
public class TriggerOnAccountHelper {
     public static void myTriggerMethod(List<Account> accList) {
         //We instansiate a new account list
        List<Account> addList = new List<Account>();
         
         //Here is our for loop for the account, where if an accout is made 
         //with the rating equaling to null or none it will be populated with 
         //rating warm.
        for(Account acc : accList) {
            if(acc.Rating == null) {
                acc.Rating='Warm';
            }
            addList.add(acc);
        }
    }
}