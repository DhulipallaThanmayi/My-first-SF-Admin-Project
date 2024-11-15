trigger triggerday2 on Opportunity (before insert, after insert) {
    /*for(Opportunity op : trigger.new){
        if(op.Amount!=NUll && op.Amount > 100000){
            op.Description = 'HOT OPPO';
        }
    }*/
    if(trigger.isInsert){
        if(trigger.isAfter){
          // trigger44Handler.method7(Trigger.new);
        }
    }
}