public class trigger44Handler {
    
    public static void ClosedLostReason(List<Opportunity> lisOpp, Map<Id, Opportunity> mapOpp){
        //List<Opportunity> finalOpp = new List<Opportunity>();
        for(Opportunity op : lisOpp){
            if(op.StageName=='Closed Lost' && mapOpp.get(op.Id).StageName!=op.StageName){
                if(op.Reason_to_Lose__c!='Not Interested'){
                    op.addError('Select the Reason. okay. dont piss me off');
                	//finalOpp.add(op);
                }
            }
        }
    }
        /*for(Opportunity op : finalOpp){
                op.addError('Select the Reason. okay. dont piss me off');
            }
        }
    /*
    public static void noEdit7days(List<Account> accLis){
        List<Account> acLi  = new List<Account>();
        for(Account ac : accLis){
            if(ac.Created_Date__c < system.today()-7){
                ac.addError('You cannot edit the Account wait!');
            }
        }
    }
    
    
    /*
    public static void updateContactPhone(List<Account> accLi, Map<Id, Account> mapLis){
        Map<Id,Account> conList = new Map<Id,Account>();
        for(Account acc : accLi){
            if(acc.Phone!=Null && acc.Phone!=mapLis.get(acc.Id).Phone){
                conList.put(acc.Id, acc);
            }
        }
        List<Contact> conNew = new List<Contact>();
        List<Contact> conli = [Select Id, Phone, AccountId from Contact where AccountId IN : conList.keySet()];
        for(Contact con : conli){
            con.OtherPhone = conList.get(con.AccountId).Phone;
            conNew.add(con);
        }
        update conNew;
    }
    
    /*public static Boolean Triggerisexecuting(List<Account> lisAcc){
        if(Trigger.isExecuting){
            system.debug('This is executed by trigger'+ Trigger.isExecuting);
        }
        else{
            system.debug('Not executed by trigger');
        }
        return Trigger.isExecuting;
    }

    /*public static void OppoSizeTask(List<Opportunity> OppoList){
        Set<Id> ids = new Set<Id>();
        List<Account> opList = new List<Account>();
        if(!OppoList.isEmpty()){
            for(Opportunity op :OppoList){
                if(op.AccountId!=Null){
                	ids.add(op.AccountId);
                }
            }
        }
        for(Account acc : [Select Id,Oppo_Size_by_Trigger__c, (Select Id, Name from Opportunities) from Account where Id IN: ids]){
            acc.Oppo_Size_by_Trigger__c  = acc.Opportunities.size();
            opList.add(acc);
        }
        if(!opList.isEmpty()){
            update opList;
        }
    }
    */
     /* public static void DeletePositn(List<Position__c> lis){
        for(Position__c p : lis){
            
            if(p.Status__c != 'Closed'){
                p.addError('common this is easy');
            }
        }
        
    }
     
    /*public static void deleteAccountifActive(List<Account> LisAccount){
        if(!LisAccount.isEmpty()){
        for(Account c : LisAccount){
            if(c.Active__c=='Yes'){
                c.addError(Label.Demo_Account_delete_Error);
            }
        }}
    }
    /*public static void UpdateOppostoClosedLost(List<Account> LisAccount, Map<Id, Account> oldMap){
        Set<Id> acL = new Set<Id>();
        for(Account ac : LisAccount){
            if(ac.Active__c=='No' && oldMap.get(ac.Id).Active__c=='Yes'){
                acL.add(ac.Id);
            }
        }
        List<Opportunity> finalli = new List<Opportunity>();
        if(!acL.isEmpty()){
            for(Account a : [Select Id,Active__c, (Select Id, StageName from Opportunities) from Account 
                             where Id IN : acL]){
                                 if(a.Opportunities!=Null){
                                     for(Opportunity op1 : a.Opportunities){
                                         if(op1.StageName!='Closed Won' && op1.StageName!='Closed Lost'){
                                             op1.StageName= 'Closed Lost';
                                             finalli.add(op1);
                                         }
                                     }
                                 }  
                
            update finalli;
        }
        }
    }
    /*public static void OppoStageTask(List<Opportunity> oppL, Map<Id, Opportunity> mapOld){
        //Map<Id,Opportunity> idL = new Map<Id,Opportunity>();
        List<Task> tL = new List<Task>();
        for(Opportunity opo : oppL){
            if(opo.StageName!=mapOld.get(opo.Id).StageName){
               // idL.put(opo.Id,opo);
            //}
        //}
        //List<Task> tL = new List<Task>();
        //for(Opportunity op : idL.values()){
                Task t = new Task();
                t.Status = 'Not Started';
                t.Subject = opo.Name+opo.StageName;
                t.Priority ='Normal';
                t.OwnerId = opo.OwnerId;
                t.WhatId = opo.Id;
            	tL.add(t);
        	}
        }
        insert tL;
    }
    /*public static void OpportunityAmountonOppo(List<Opportunity> lisA, Map<Id,Opportunity> mapAc){
    	Set<Id> AccId = new Set<Id>();
        for(Opportunity op : lisA){
            AccId.add(op.AccountId);
        }
        List<Account> acLt = [Select Max_Amount_on_Oppo__c, (Select Name,Amount from Opportunities where Amount!=Null
                                                            Order by Amount desc limit 1) from Account where Id In : AccId];
        List<Account> acL = new List<Account>();
        for(Account a : acLt){
            a.Max_Amount_on_Oppo__c = a.Opportunities[0].Amount;
            acL.add(a);
        }
        update acL;  
	}
    /*public static void AccBillingtoCotactBilin(List<Account> accL, Map<Id, Account> mapisOld){
        //using Map
        /*Map<Id, Account> AcLis = new Map<Id, Account>();
        for(Account ac : accL){
            if(ac.BillingCity!=Null && ac.BillingCountry!=Null && ac.BillingStreet!=Null && ac.BillingState!=Null &&
               			ac.BillingPostalCode!=Null){
                   AcLis.put(ac.Id, ac);
               }
        }
        List<Contact> conLi = new List<Contact>();
        for(Contact c : [Select Id, MailingStreet,MailingCity, MailingState,AccountId, MailingCountry, MailingPostalCode
                         from Contact where AccountId IN  : AcLis.keyset() ]){
                             c.MailingCity = AcLis.get(c.AccountId).BillingCity;
                             c.MailingCountry= AcLis.get(c.AccountId).BillingCountry;
                             c.MailingStreet = AcLis.get(c.AccountId).BillingStreet;
                             c.MailingState = AcLis.get(c.AccountId).BillingState;
                             c.MailingPostalCode = AcLis.get(c.AccountId).BillingPostalCode;
                             conLi.add(c);
                         }
        update conLi;
        //using Parent SOQL
		
        for(Account ac : accL){
            List<Contact> conLitoUpdate = new List<Contact>();
            if(ac.BillingCity!=mapisOld.get(ac.Id).BillingCity || ac.BillingCountry!=mapisOld.get(ac.Id).BillingCountry
              || ac.BillingStreet!=mapisOld.get(ac.Id).BillingStreet && ac.BillingState!=mapisOld.get(ac.Id).BillingState
               || ac.BillingPostalCode!=mapisOld.get(ac.Id).BillingPostalCode){
            	List<Contact> conLi = [Select Id, MailingStreet,MailingCity, MailingState,AccountId, MailingCountry, MailingPostalCode from Contact where AccountId =: ac.Id]; 
                for(Contact c : conLi){
                            c.MailingCity = ac.BillingCity;
                            c.MailingCountry= ac.BillingCountry;
                            c.MailingStreet = ac.BillingStreet;
                            c.MailingState =ac.BillingState;
                            c.MailingPostalCode = ac.BillingPostalCode;
                            conLitoUpdate.add(c);
                }
                update conLitoUpdate	;
             }
        }
    }*/
    /*public static void updateJobApp_withnoReview(List<Job_Application__c> jbA, Map<Id, Job_Application__c> JabsOldMap){
        for(Job_Application__c jbp : jbA){
            if(jbp.Status__c=='Closed'){
               if(jbp.Stage__c=='Closed - Accepted'){
                system.debug(jbp);
                List<Review__c> r = [Select Id from Review__c where Job_Application__c=:jbp.Id];
                system.debug(r);
                    if(r.isEmpty()){
                    	jbp.addError('Pls add a Review before closing');
                    }
               }
            }
        }
    }   
*/      
    
    //Write a trigger to throw error when user deactivates the account record and if that account 
    //has atleast one opportunity with the stage not equal to closed won or closed lost.
    /*public static void deactiveateACcountwhithaOppo(List<Account> accL, Map<Id, Account> mapisOld){
      
       // List<Opportunity> oppL = new List<Opportunity>();
        //Map<Id,Account> acId = new Map<Id,Account>();
        //i need oppos of accounts
        for(Account a : accL){	//[Select Id,Active__c from Account where Id in : accL]){
            if(a.Active__c=='No' && mapisOld.get(a.Id).Active__c=='Yes'){
            		//acId.put(a.Id,a);
        		//for(Opportunity op :
                List<Opportunity> oppL = [Select Id from Opportunity where StageName NOT IN('Closed Won', 'Closed Lost') and AccountId = : a.Id];
            		//if(op.StageName!='ClosedWon' || op.StageName!='ClosedLost'){
                    //oppL.add(op);
                    if(!oppL.isEmpty()){
                        a.addError('This Account cannot be deleted because there are open oppos');
            		}
        		}
        	}
    	//}
	}
}    //for(Account a : acId.values()){
          //  if(!oppL.isEmpty()){
        		
            //}
        //}
   /* public static void trigger44(List<Account> li){
        for(Account acc : li){
        		acc.Description = 'Test Thanmayi day 44';
    		}
    }
    
    public static void trigger45prob2(List<Account> li2){
        List<Opportunity> opList = new List<Opportunity>();
            for(Account ac : li2){
                Opportunity op = new Opportunity(Name='trigger'+ac.Name,CloseDate=system.today(),StageName='Qualification', Amount = 1000);
                op.AccountId = ac.Id;
                opList.add(op);
            }
        /*this is generic DML statement
        insert opList; 
		*/
       /* DataBase.SaveResult[] Srli = DataBase.insert(opList, false);
        for(Integer i=0;i<Srli.size();i++){
            if(!Srli[i].isSuccess()){
                String errors = '';
                for(DataBase.Error err : Srli[i].getErrors()){
                    errors = errors+err.getMessage();
                }
                li2[i].addError(errors);
            }
        }
    }
    /*
    public static void method3(List<Position__c> polIs){
        for(Position__c v : polIs){
                if(v.Status__c=='New'){
                    if(v.Open_Date__c==Null){
                        v.Open_Date__c=system.today();
                    }
                    if(v.Min_Pay__c==Null){
                        v.Min_Pay__c=10000;
                    }
                    if(v.Max_pay__c==Null){
                        v.Max_pay__c=15000;
                    }
            	}
    	}
	}
    
    public static void method4(List<Position__c> polis){
        List<Task> tL  = new List<Task>();
        for(Position__c p : polis){
            if(p.Status__c=='New'){
                Task t = new Task();
                t.Status = 'Not Started';
                t.Subject = p.Department__c;
                t.Priority ='Normal';
                t.OwnerId = p.OwnerId;
                t.WhatId = p.Id;
                tL.add(t);
            }
        }
        insert tL;
    }
    
    public static void method5(List<Account> lik){
        for(Account a : lik){
            if(a.CopyBillingtoShipping__c==True){
                a.ShippingCity = a.BillingCity ;
               a.ShippingCountry = a.BillingCountry;
                 a.ShippingStreet = a.BillingStreet ;
                 a.ShippingState = a.BillingState ;
                a.ShippingPostalCode = a.BillingPostalCode ;
            }
        }
        //update lik;
    }
    
    /*public static void method6(List<Case> cs){
        List<Account> acLis = new List<Account>();
    	for(case ac : cs){
        if(ac.AccountId!=Null){
            Id ai = ac.AccountId;
            Account a = [Select Id , Name, case_number__c from Account where Id = : ai];
            a.case_number__c = ac.CaseNumber;
            acLis.add(a);
        }
    }
    update acLis;
    }
    
    public static void method7(List<Opportunity> Oppos){
        List<Account> acList99 = new List<Account>();
    	for(Opportunity Opp : Oppos){
            if(Opp.AccountId!=Null && Opp.Amount!=Null){
                system.debug(Opp.Amount);
                Account a = [Select Id,final_amount_on_Opp__c, Amount_of_Oppo__c from Account where Id = : Opp.AccountId];
                //Account a = new Account();
                a.Id = Opp.AccountId;
                a.final_amount_on_Opp__c = Opp.Amount;
                a.Amount_of_Oppo__c = Opp.Amount;
                system.debug(a.final_amount_on_Opp__c);
                acList99.add(a);
            }
    	}
        if(!acList99.isEmpty()){
    		update acList99;
        }}
    public static void method8(List<Account> AccLis){
        List<Opportunity> opLis = new List<Opportunity>();
        List<Contact> conList = new List<Contact>();
        for(Account a : AccLis){
            if(a.Extra_Contact__c == true){
                Contact c = new Contact();
                c.LastName = a.Name;
                c.AccountId=a.Id;
                conList.add(c);
            }
            if(a.Active__c=='Yes' && a.Extra_Opportunity__c==true){
                    Opportunity op = new Opportunity();
                    op.StageName= 'Prospecting';
                    op.Name = a.Name;
                    op.CloseDate = system.today();
                    op.Amount = 122200;
                    op.AccountId=a.Id;
                    opLis.add(op);
            }
        }
        insert conList;
        insert opLis;
    }
    public static void updateDay46(List<Account> accList, Map<Id,Account> mapOld){
        for(Account aN: accList){
            //this is to check that oldMap se ki that their values deosnt match
                if(aN.Phone!=Null && aN.Phone!= mapOld.get(aN.Id).Phone){
                    aN.Description = 'Updated Now'+aN.Phone;
                }
            }
    }
    public static void updateDay46prob2(List<Account> accList, Map<Id,Account> mapOld2){
        List<Account> aL = new List<Account>();
        for(Account ac : accList){
            if((ac.Industry!=Null && ac.Industry=='Media') ||( ac.Industry=='Media' && 
                                                              ac.Industry!=mapOld2.get(ac.Id).Industry)){
                ac.Rating='Hot';
                aL.add(ac);
            }
        }
        //upsert aL;
    }
    public static void afetrUpdatecontact(List<Account> accList, Map<Id, Account> oldMapis){
        List<Contact> con1 = new List<Contact>();
        Map<Id, Account> accIds = new Map<Id, Account>();
        for(Account a : accList){
            if(a.Phone!=Null && a.Phone!=oldMapis.get(a.Id).Phone){
            	accIds.put(a.Id,a);
            }
        }
        for(Contact con : [Select Id, Phone from Contact where AccountId IN: accIds.keySet()]){
            if(accIds.containsKey(con.AccountId)){
                //this below line blew my mind basically
                    con.MobilePhone=accIds.get(con.AccountId).Phone;
                    con1.add(con);
                }
            }
        update con1;
    }*/
}