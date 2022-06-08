public class QAndAController {
	      public List<Droid__c> getQAndA(){
        //query all droids in the droid__c object
        List<Droid__c> results = Database.query(
            'SELECT Id,Name,Total_Price__c ' +
            'FROM Droid__c '+
            'LIMIT 1'
        );
        return results;
          }
}