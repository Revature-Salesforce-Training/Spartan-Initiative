public with sharing class HomepageHelper {

    Contact newCon;
    Integer three;

    public HomepageHelper(ApexPages.StandardController con) {
          this.newCon = (Contact)con.getRecord();
    }
    
    
    public pagereference save(){
     // Contact a = New Contact(FirstName = newCon.FirstName, LastName = newCon.LastName);
     //Insert a;
     
       Lead a = new Lead(FirstName= newCon.FirstName, LastName= newCon.LastName, Phone= newCon.Phone, LeadSource='Web', Company='None', Description= newCon.LastName + ' subscribed to our network to get updates about our new droids and would like to buy a droid');
       insert a;

      Pagereference pr = New PageReference('/' + a.id);
      return pr;
   }


}