trigger dupspeaker on Event_Speaker__c (before insert, before update) {
    
    for(Event_Speaker__c esc: Trigger.new){
        if(esc.Speaker__c!=Null){
            esc.addError('You cant insert this record.');
        }
    }
}