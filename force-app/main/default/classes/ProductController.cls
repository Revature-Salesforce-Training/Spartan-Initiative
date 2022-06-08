/* Author: Trenton Teasdale
  Last Modified: 6/7/22
	Controller for product visualforce page
*/
public class ProductController {
    public List<Droid__c> getProducts(){
        //query all droids in the droid__c object
        List<Droid__c> results = [SELECT Id,Name,Total_Price__c,Image__c FROM Droid__c ];
        return results;
}
}