trigger triggerJobAplication on Job_Application__c (before insert, before update) {
    
    if(trigger.isUpdate){
        if(trigger.isBefore){
    		//trigger44Handler.updateJobApp_withnoReview(trigger.new,trigger.OldMap);		
            System.debug('Trigger executed on: ' + Trigger.operationType);
        }}
    
}