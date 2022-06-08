/**
 * Reis Taylor
 * Last Modified: 6/7/2022
 * Trigger to populate description field on case page layouts with
 * a description that provides useful information in addition
 * to just making it all look good.
 * .today() and daysBetween() are date class methods
 * .intValue() is an integer class method (converts decimal to integer)
 * purchaseDate.daysBetween(Date.today()) = (Date.today() - purchaseDate/warrantyDays);
 * before insert, createdDate system field was 'null'
 * but Date class function DateTime.now() was an easy workaround
 * CaseTriggerTest, CaseTrigger_Companion last modified same date
 */

trigger CaseTrigger on Case (before insert, after insert, before update) {
	
    if(Trigger.isBefore && Trigger.isInsert) {
        
        CaseTrigger_Companion.caseWarrantyDescription(Trigger.new);
        
    }

}