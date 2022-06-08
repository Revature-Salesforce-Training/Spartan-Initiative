// OppFollowUpOnOpp.trigger
// Matt McCain
// Created Date 6/7/22
// Modified Date 6/7/22
// This Helper sets a follow up date and
// publishes the Opportunity Event

trigger OppFollowUpOnOpp on Opportunity (after insert) {
    OppFollowUpOnOpp_Helper.createEvent(Trigger.new);
}