trigger day45prob1 on Account (before insert,after insert, before update,after Update, before Delete) {
    //1
    /*for(Account ac : trigger.new){
        if(ac.Industry!=Null && ac.Industry=='Media'){
            ac.Rating = 'Hot';
        }
    }*/
    //2
    //practise prob 2 
       // if(trigger.isBefore){
            //trigger44Handler.method5(trigger.new);
       // }
    if(trigger.isInsert){
        if(trigger.isAfter){
           
           //Reusing the below trigger call for Database Class to Create an opportunity hen Account is created and 
           //inserted via database class instead of DML
           //trigger44Handler.trigger45prob2(Trigger.new);
           //trigger44Handler.Triggerisexecuting(Trigger.new);
           // trigger44Handler.method8(Trigger.new);
        } 
    }
    
    if(trigger.isUpdate){
        if(trigger.isBefore){
            //trigger44Handler.noEdit7days(trigger.New);
            	//	trigger44Handler.updateDay46(trigger.New, trigger.Oldmap);
        }
        if(trigger.isAfter){
            //Update contact Phone when Updated on Account
           //trigger44Handler.updateContactPhone(Trigger.new, Trigger.oldMap); 
            //trigger44Handler.UpdateOppostoClosedLost(trigger.New, trigger.Oldmap);
            //trigger44Handler.AccBillingtoCotactBilin(trigger.New, trigger.Oldmap);
            if(triggerPreventionRecur.flag){
            	//practise48Class_recursion.MethodRecursive(trigger.new,trigger.OldMap);
            }
        }
    }
    if(trigger.isBefore){
        //for(Account ac: trigger.new){
            if(trigger.isInsert || trigger.isUpdate){// && trigger.oldMap.get(ac.Id).Industry!=ac.Industry)){
           // trigger44Handler.updateDay46prob2(trigger.New, trigger.Oldmap);
        }	//}
    }
    
    if(trigger.isUpdate){
        if(trigger.isAfter){
    		//trigger44Handler.afetrUpdatecontact(Trigger.new,trigger.oldMap);
        }
    }
    
    //Write a trigger to throw error when user deactivates the account record and if that account 
    //has atleast one opportunity with the stage not equal to closed won or closed lost.
    if(trigger.isUpdate){
        if(trigger.isBefore){
           // trigger44Handler.deactiveateACcountwhithaOppo(trigger.New, trigger.OldMap);
        }
    }
    if(trigger.isDelete){
       /* if(trigger.isBefore){
            for(Account ac: trigger.old){
                Id idd = UserInfo.getUserId();
                if(idd == '0055h000007am7QAAQ'){
            		//trigger44Handler.deleteAccountifActive(trigger.Old);
    			}
            }
    	}*/
    }
}