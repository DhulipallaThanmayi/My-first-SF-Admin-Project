trigger triggeronOpportunity on Opportunity (before insert, after Update, after insert, after delete) {
    if(trigger.isInsert){
        if(trigger.isAfter){
            //trigger44Handler.method7(trigger.new);
        }
    }
    if(trigger.isUpdate){
        if(trigger.isAfter){
            if(!triggerPreventionRecur.Flag){
                triggerPreventionRecur.Flag = true;
            	practise48Class_recursion.Opportuniytmethod(trigger.New, trigger.oldMap);
                
            }
    		//trigger44Handler.OpportunityAmountonOppo(trigger.New, trigger.Oldmap);
            //trigger44Handler.OppoStageTask(trigger.New, trigger.Oldmap);
        }
        if(Trigger.isBefore){
            trigger44Handler.ClosedLostReason(trigger.new, trigger.OldMap);
        }
    }
    if(trigger.isInsert){
        if(trigger.isAfter){
           // trigger44Handler.OppoSizeTask(trigger.new);
        }
    }
     if(trigger.isDelete){
        if(trigger.isAfter){
           // trigger44Handler.OppoSizeTask(trigger.old);
        }
    }
    
    if(trigger.isBefore){
        if(trigger.isInsert){
            practise48Class_recursion.vaidationViaTrigger(trigger.New);
        }
    }
    
    
}