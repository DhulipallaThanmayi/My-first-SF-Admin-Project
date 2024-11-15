trigger practiseTriggerday47onContact on Contact (before insert, after insert, after delete, after undelete) {

    if(trigger.isInsert){
        if(trigger.isAfter){
            triggerdemo.deleteInsertUndeleteUpdate(trigger.new);
        }
    }
    if(trigger.isDelete){
        if(trigger.isAfter){
            triggerdemo.deleteInsertUndeleteUpdate(trigger.old);
        }
    }
    if(trigger.isUndelete){
        if(trigger.isAfter){
            triggerdemo.deleteInsertUndeleteUpdate(trigger.new);
        }
    }
}