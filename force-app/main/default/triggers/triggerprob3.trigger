trigger triggerprob3 on Position__c (before insert, after Insert, before delete) {
    
    if(trigger.isInsert){
        if(trigger.isBefore){
        	//trigger44Handler.method3(trigger.new);   
        }
    	else if (trigger.isAfter){
            //	trigger44Handler.method4(trigger.new); 
        }
    }
    
    if(trigger.isDelete){
        if(trigger.isBefore){
           // trigger44Handler.DeletePositn(trigger.old); 
            
        }
    }
}