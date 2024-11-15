trigger dup_EveSpeaker on Event_Speaker__c (before insert, before update) {
    Set<Id> eventslist=new Set<Id>();
    Set<Id> speakerslist=new Set<Id>();
    
    for(Event_Speaker__c esc:Trigger.new){
        speakerslist.add(esc.Speaker__c);
        eventslist.add(esc.Event__c);
    }
    Map<Id, Datetime> listevents=new Map<Id, Datetime>();//[Select Id, Startingdate__c from Event__c where Id IN: eventslist]);
    List<Event__c> relatedeven=[Select Id, Startingdate__c from Event__c where Id IN: eventslist];
    for(Event__c eve:relatedeven){
    	listevents.put(eve.Id, eve.Startingdate__c);
    }
    List<Event_Speaker__c> speakerlist=[Select Id, Event__c, Event__r.Startingdate__c, Speaker__c from Event_Speaker__c where Speaker__c IN:speakerslist];
    for(Event_Speaker__c esco:Trigger.new){
        Datetime bookingtime=listevents.get(esco.Event__c);
        for(Event_Speaker__c es1 : speakerlist) {
            if(esco.Speaker__c==es1.Speaker__c && bookingtime==es1.Event__r.Startingdate__c){
                esco.Speaker__c.addError('The speaker is already booked ');
                esco.addError('The speaker is already booked at that time');
            }             
    }
    }
}