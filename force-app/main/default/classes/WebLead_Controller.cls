public class WebLead_Controller {

    private final Lead ld;

    public WebLead_Controller(ApexPages.StandardController sc) {
        this.ld = (Lead) sc.getRecord();
    }
    public static List<SelectOption> getOurTypes() {
        List<selectOption> rTypes = new List<selectOption>();    
        for (RecordType  a : 
                [SELECT DeveloperName, Name FROM RecordType 
                WHERE SobjectType = 'Lead']) 
                {
                    rTypes.add(new selectOption(a.DeveloperName, a.Name));
                }
        return rTypes; 
    }
}