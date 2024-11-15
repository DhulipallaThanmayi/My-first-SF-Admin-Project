@isTest
public class testClassTriggerpractise {
    
    @isTest
    public static void QueuablTest(){
        //List<Account> acL = new List<Account>();
        Account acc = new Account();
        acc.Name = 'QTesttthanmayiiii';
        acc.coMMMM__c= 'Test';
        acc.i_aGREE__c = True;
        acc.INS__c = 'A';
        acc.Industry = 'Media';
        insert acc;
        //acL.add(acc);
        //insert acL;
        Test.startTest();
        Batchingclass bc2 = new Batchingclass();
		Id b = system.enqueueJob(bc2);
        Test.stopTest();
        List<COntact> cl= [select Id from Contact where AccountId = : acc.Id];
        system.assertEquals(1,cl.size());
    }
    /*@isTest
    public static void asynchronousPractise(){
        List<Account> lisAcc = new List<Account>();
        for(integer i=0;i<5;i++){
            Account acc = new Account();
            acc.Name = 'Testtthanmayiiii'+i;
            acc.coMMMM__c= 'Test';
            acc.i_aGREE__c = True;
            acc.INS__c = 'A';
            lisAcc.add(acc);
        }
		insert lisAcc;
        Test.starttest();
        List<Case> csLi = new List<Case>();
        for(Account ac: lisAcc){
            Case cc = new Case();
            cc.Status = 'New';
            cc.Origin = 'Email';
            cc.AccountId = ac.Id;
            csLi.add(cc);
    
    		Case cc1 = new Case();
            cc1.Status = 'New';
            cc1.Origin = 'Phone';
            cc1.AccountId = ac.Id;
            csLi.add(cc1);
    
    		Case cc2 = new Case();
            cc2.Status = 'New';
            cc2.Origin = 'Web';
            cc2.AccountId = ac.Id;
            csLi.add(cc2);
        }
        insert csLi;
        List<Id> Idli = new List<Id>();
        for(Account ac : lisAcc){
        	Idli.add(ac.Id);
        }
        AsynchronousApex52Future.practiseFutureMethod(Idli);
        test.stoptest();
        List<Account> lisAcc2 = [Select Id, Case_Count_by_Phone__c, Case_count_by_Web__c,Case_count_by_Email__c
                                from Account where Name like '%Testtthanmayiiii%'];
        system.assertEquals(1,lisAcc2[0].Case_Count_by_Phone__c);
        system.assertEquals(1,lisAcc2[0].Case_count_by_Web__c);
        system.assertEquals(1,lisAcc2[0].Case_count_by_Email__c);
    }*/
    
    /*
    @isTest
    public static void CaseFuture(){
        List<Account> lisAcc = new List<Account>();
        for(Integer i=0;i<8;i++){
            Account acc = new Account();
            acc.Name = 'Testt';
            acc.coMMMM__c= 'Test';
            Date d = system.today()-7;
            acc.Created_Date__c = d;
            acc.i_aGREE__c = True;
            acc.INS__c = 'A';
            lisAcc.add(acc);
    	}
        Test.startTest();
        insert lisAcc;
        List<Id> ids = new List<Id>();
        List<Case> csLi = new List<Case>();
        for(Account ac: lisAcc){
            Case cc = new Case();
            cc.Status = 'New';
            cc.Origin = 'Web';
            cc.AccountId = ac.Id;
            csLi.add(cc);
            ids.add(ac.Id);
        }
        insert csLi;
        
        AsynchronousApex52Future.futurAccounCases(ids);
        Test.stopTest();
        
        List<Account> lisAcc1 = [Select Id, Case_Count_via_Future_method__c from Account where Name like '%Testt%'];
        system.assertEquals(1, lisAcc1[0].Case_Count_via_Future_method__c);
    }
    /*@isTest
    public static void daysback7(){
        List<Account> lisAcc = new List<Account>();
        for(Integer i=0;i<8;i++){
            Account acc = new Account();
            acc.Name = 'Test Class Can delete';
            acc.coMMMM__c= 'Test';
            Date d = system.today()-7;
            acc.Created_Date__c = d;
            acc.i_aGREE__c = True;
            acc.INS__c = 'A';
            lisAcc.add(acc);
        }
        insert lisAcc;
        Test.startTest();
        //Boolean exceptionThrown = false;
        try{
        for(Account a : lisAcc){
            a.Rating = 'Hot';
        }
            update lisAcc;}
        catch(Exception E){
           // exceptionThrown = True;
            //Boolean expectedExceptionThrown = (e.getMessage().contains('You cannot edit the Account wait!'))? true : false;
            //system.assertEquals(true, expectedExceptionThrown, e.getMessage());
            system.assertEquals('You cannot edit the Account wait!', e.getMessage());
        }
        //system.assertEquals(true, exceptionThrown, 'No Exception');
        test.stoptest();
    }
    
/*
 *     @isTest
    public static void accountPhonetoContactPhone(){
        List<Account> accLis = new List<Account>();
        for(Integer i=0;i<8;i++){
            Account acc = new Account();
            acc.Name = 'Test Class';
            acc.coMMMM__c= 'Test';
            acc.Phone = '98765';
            acc.i_aGREE__c = True;
            acc.INS__c = 'A';
            accLis.add(acc);
        }
        insert accLis;
        List<Contact> con1 = new List<Contact>();
        for(Account ac : accLis){
            Contact c = new Contact (LastName= ac.Name,AccountId= ac.Id);
            con1.add(c);
        }
        insert con1;
        Test.startTest();
        
        for(Account ac : accLis){
            ac.Phone = '1234';

        }
        update accLis;

        List<Account> acL = [Select Id, Phone from Account where Phone = '1234'];
        List<Contact> conL = [Select Id, OtherPhone from Contact where AccountId = : acL[0].Id];
        system.assertEquals(acL[0].Phone, conL[0].OtherPhone);
        Test.stopTest();
    }
/*
    //Test Class for Alert method
    @isTest
    public static void alertTestClass(){
        List<Account> accLis = new List<Account>();
        for(Integer i=0;i<8;i++){
            Account acc = new Account();
            acc.Name = 'Test Class';
            acc.coMMMM__c= 'Test';
            acc.i_aGREE__c = True;
            acc.INS__c = 'A';
            accLis.add(acc);
        }
        Test.startTest();
        insert accLis;
        DataBase.SaveResult[] srList = Database.insert(accLis, false);
        Test.stopTest();
        list<Opportunity> oppLis = [select Id from Opportunity where Id = : accLis[0].Id];
        system.assert(oppLis!=null, 'Opportunity is not created');
        
    }*/
    //1 practise prob 1 
   /* @isTest
    public static void createOppDesc(){
        List<Opportunity> opList  = new List<Opportunity>();
        for(Integer i=0;i<10;i++){
        Opportunity op = new Opportunity ();
        op.StageName= 'Prospecting';
        op.Name = 'Test class';
        op.CloseDate = system.today();
        op.Amount = 122200;
        opList.add(op);
    } 
    Test.startTest();
    insert opList;
    Test.stopTest();
        List<Opportunity> updatedlist = [Select Id, Description from Opportunity where Id = : opList[0].Id];
        system.assertEquals('HOT OPPO', updatedlist[0].Description);
}
    @isTest
    public static void shippingAddress(){
        List<Account> accLis = new List<Account>();
        for(Integer i=0;i<8;i++){
            Account acc = new Account();
            acc.Name = 'Test Class';
            acc.CopyBillingtoShipping__c = True;
            acc.BillingCity = 'BCITY';
            acc.BillingStreet = 'BSTREET';
            acc.BillingState = 'BSTATE';
            acc.BillingCountry = 'BCountry';
            acc.BillingPostalCode = '1234567890';
            accLis.add(acc);
        }
        Test.startTest();
        insert accLis;
        Test.stopTest();
        List<Account> accLis3 = [Select Id, BillingCity,BillingState, BillingStreet, 
                                 BillingCountry, BillingPostalCode, ShippingCity, 
                                 ShippingState,ShippingStreet, ShippingCountry, 
                                 ShippingPostalCode from Account where Name like 'Test C%']; 
        system.assertEquals(accLis3[0].BillingCity, accLis3[0].ShippingCity);
        system.assertEquals(accLis3[0].BillingState, accLis3[0].ShippingState);
        system.assertEquals(accLis3[0].BillingCountry, accLis3[0].ShippingCountry);
        system.assertEquals(accLis3[0].BillingPostalCode, accLis3[0].ShippingPostalCode);
        system.assertEquals(accLis3[0].BillingCountry, accLis3[0].ShippingCountry);
    } 
    @isTest
    public static void CaseDet(){
        Account a = new Account(Name ='Thanmayi');
        insert a;
        Case cas = new Case(Origin='Web', Status= 'New');
        cas.AccountId = a.Id;
        insert cas;
        Test.startTest();
        Test.stopTest();
        system.assertEquals(cas.CaseNumber, a.case_number__c);
    } 
    @isTest
    public static void OppoAmount(){
        Account ac = new Account(Name='tha');
        insert ac;
        
        Opportunity oppo = new Opportunity(Name='trigger',CloseDate=system.today(),
                                           StageName='Qualification',Amount=68790);
        oppo.AccountId = ac.Id;
        test.startTest();
        insert oppo;
        test.stopTest();
        List<Account> acli = [Select Id,final_amount_on_Opp__c,Amount_of_Oppo__c from Account where Id = : ac.Id]; 
        system.assertEquals(oppo.Amount, acli[0].final_amount_on_Opp__c);
        system.assertEquals(oppo.Amount, acli[0].Amount_of_Oppo__c);
    }
    
    @isTest
    public static void checkbox(){
        Account ac = new Account(Name = 'Test Class333',Extra_Contact__c=True, Extra_Opportunity__c=True);
        
        Account ac2 = new Account(Name = 'Test Class222',Extra_Contact__c=True, Extra_Opportunity__c=True,Active__c='Yes');
        
        Test.startTest();
        insert ac;
        insert ac2;
        Test.stopTest();
        List<Contact> con1 = [Select Id from Contact where AccountId = :ac.Id];
        List<Contact> con2 = [Select Id from Contact where AccountId = :ac2.Id];
        List<Opportunity> opp1 = [Select Id from Opportunity where AccountId = : ac.Id];
        List<Opportunity> opp2 = [Select Id from Opportunity where AccountId = : ac2.Id];
        system.assertEquals(1,con1.size());
        system.assertEquals(0,opp1.size());
        system.assertEquals(1,con2.size());
        system.assertEquals(1,opp2.size());
    }
    
    @isTest
    public static void testUpdatePhone(){
        List<Account> accLis1 = new List<Account>();
        //List<Account> accLis2 = new List<Account>();
        for(Integer i=0;i<6;i++){
        	Account ac = new Account(Name = 'Test Class update test'+i);
            accLis1.add(ac);
        }
        insert accLis1;
        test.startTest();
        for(Account aca:accLis1){
            aca.Phone = '875641';
        }
        update accLis1;
        
        Account a1 =[Select Id, Description,Phone from Account where Id = : accLis1[0].Id];
        system.assertEquals('Updated Now875641',a1.Description);

        for(Account aca:accLis1){
            aca.Phone = '8756413';
        }
        update accLis1;
        
        Account a2 =[Select Id, Description,Phone from Account where Id = : accLis1[0].Id];
        system.assertNotEquals('Updated Now8756413',a2.Description);
        test.stopTest();
    }
    @isTest
    public static void testAccBillingtoCotactBilin(){
        List<Account> accLis1 = new List<Account>();
        for(Integer i=0;i<6;i++){
        	Account ac = new Account(Name = 'Test Class update test'+i, BillingCity='t',BillingCountry='IN',
                                     BillingStreet='Null', BillingState='State', BillingPostalCode='009');
            accLis1.add(ac);
        }
        test.startTest();
        insert accLis1;
        List<Contact> con1 = new List<Contact>();
        for(Account ac : accLis1){
            Contact c = new Contact (LastName= ac.Name,AccountId= ac.Id);
            con1.add(c);
        }
        insert con1;
        for(Account ac : accLis1){
            ac.BillingCity= 'HYd';}
        update accLis1;
        test.stopTest();
        List<Contact> ca = [Select Id , MailingCity from Contact where Id = : con1[0].Id];
        system.assertEquals('HYd' , ca[0].MailingCity);
    }
    @isTest
    public static void updateJobApp_withnoReviewTestClass(){
        
        Job_Application__c jb = new Job_Application__c(Status__c='New',Candidate__c='a0AJ2000000N3oOMAS', Position__c='a0DJ2000001MN56MAG');
        insert jb;
        String msg = 'Pls add a Review before closing';
       	//jb.addError('Name', msg);
        test.startTest();
        jb.Status__c='Closed';
        update jb;
        jb.Stage__c = 'Closed - Accepted';
        try{
        	updATE JB;
        }
        catch(DMLException e){
            System.assertEquals('Pls add a Review before closing', e.getDmlMessage(0));       
    	}
        test.stopTest();	
    }
    @isTest
    public static void TaskonOpportunity(){
    	List<Opportunity> opList  = new List<Opportunity>();
        for(Integer i=0;i<10;i++){
            Opportunity op = new Opportunity ();
            op.StageName= 'Prospecting';
            op.Name = 'Test class'+i+'12';
            op.CloseDate = system.today();
            op.Amount = 122200;
            opList.add(op);
        }
        insert opList;
        test.startTest();
        for(Opportunity op : opList){
            op.StageName='Qualification';
        }
        update opList;
        Test.stopTest();
        String SubjN = opList[0].Name + opList[0].StageName;
        List<Task> tL = [Select Id, Subject from Task where Subject =: SubjN];
        Integer size = tL.size();
        system.assertEquals(1,size);
    }
    @isTest
    public static void inActivateAccountUpdateOpportunities(){
        List<Account> accLis = new List<Account>();
        for(Integer i=0;i<8;i++){
            Account acc = new Account();
            acc.Name = 'Test Class';
            acc.Active__c = 'Yes';
            accLis.add(acc);
        }
        insert accLis;
        List<Opportunity> opList  = new List<Opportunity>();
        for(Account ac : accLis){
            Opportunity op = new Opportunity ();
            op.StageName= 'Prospecting';
            op.Name = 'Test class'+ac.Name;
            op.CloseDate = system.today();
            op.Amount = 122200;
            op.AccountId = ac.Id;
        	opList.add(op);
    	}
        insert opList;
        for(Account ac : accLis){
            ac.Active__c = 'No';
        }
        update accLis;
        List<Opportunity> op = [Select Id, StageName from Opportunity where Id = : opList[0].Id];
        system.assertEquals('CLosed Won', op[0].StageName);//should fail bcz its closed lost only
    }
    @isTest
    public static void triggeronContactIN_DEL_UNDE(){
        Account ac = new Account(Name = 'Test Class insert delete test');
        insert ac;
        Contact c = new Contact (LastName= ac.Name,AccountId= ac.Id);
        Test.startTest();
        insert c;
        List<Account> acc  = [ select Id, contacts_from_trigger__c,(Select Id from Contacts) from Account where Id = : ac.Id];
        system.assertEquals(acc[0].contacts_from_trigger__c, acc[0].Contacts.size());
        system.debug(acc[0].contacts_from_trigger__c);
        system.debug(acc[0].Contacts.size());
    }
    @isTest
    public static void triggeronContactIN_DEL_UNDE2(){
        Account ac = new Account(Name = 'Test Class insert delete test3');
        insert ac;
        Contact c = new Contact (LastName= ac.Name,AccountId= ac.Id);
        insert c;
        Test.startTest();
        delete c;  
        List<Account> acc  = [ select Id, contacts_from_trigger__c,(Select Id from Contacts) from Account where Id = : ac.Id];
        system.assertEquals(acc[0].contacts_from_trigger__c, acc[0].Contacts.size());
        system.debug(acc[0].contacts_from_trigger__c);
        system.debug(acc[0].Contacts.size());
        Test.stopTest();      
    }
    @isTest
    public static void OppoTesting(){
        Account ac = new Account(Name = 'Test Opportunity insert delete test3');
        insert ac;
        Opportunity op = new Opportunity ();
        op.StageName= 'Prospecting';
        op.Name = 'Test class';
        op.CloseDate = system.today();
        op.AccountId = ac.Id;
        insert op;
        Opportunity op1 = new Opportunity ();
        op1.StageName= 'Prospecting';
        op1.Name = 'Test class';
        op1.CloseDate = system.today();
        op1.AccountId = ac.Id;
        insert op1;
        Test.startTest();
        List<Account> acc  = [Select Id, Oppo_Size_by_Trigger__c,(Select Id from Opportunities) from Account where Id = : ac.Id];
        system.assertEquals(acc[0].Oppo_Size_by_Trigger__c, acc[0].Opportunities.size());
        system.debug(acc[0].Oppo_Size_by_Trigger__c);
        system.debug(acc[0].Opportunities.size());
        Test.stopTest(); 
    }
    public static void OppoTesting2(){
        Account ac1 = new Account(Name = 'Test Opportunity insert delete test3');
        insert ac1;
        List<Opportunity> opl = new List<Opportunity>();
        Opportunity op = new Opportunity ();
        op.StageName= 'Prospecting';
        op.Name = 'Test class';
        op.CloseDate = system.today();
        op.AccountId = ac1.Id;
        opl.add(op);
        Opportunity op1 = new Opportunity ();
        op1.StageName= 'Prospecting';
        op1.Name = 'Test class';
        op1.CloseDate = system.today();
        op1.AccountId = ac1.Id;
        opl.add(op1);
        Test.startTest();
        insert opl;
        for(Opportunity opw : opl){
        	delete opw;
        }
        List<Account> ac  = [Select Id, Oppo_Size_by_Trigger__c,(Select Id from Opportunities) from Account where Id = : ac1.Id];
        system.assertEquals(ac[0].Oppo_Size_by_Trigger__c, ac[0].Opportunities.size());
        system.debug(ac[0].Oppo_Size_by_Trigger__c);
        system.debug(ac[0].Opportunities.size());
        Test.stopTest();        
    }*/
}