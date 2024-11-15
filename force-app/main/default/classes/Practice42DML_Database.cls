public class Practice42DML_Database {
    public static void practiseOnly(){
        /*
        //1
        List<Account> lisA = new List<Account>();
        for(Integer i = 0; i< 5;i++){
            Account c = new Account();
            c.First_Name__c = 'Test' +i; c.Phone = '123456'; c.Name='Test' +i;
            lisA.add(c);
        }
        insert lisA;
        //2
        List<Opportunity> lisO = new List<Opportunity>();
        for(Integer i = 0; i< 5;i++){
            Opportunity o = new Opportunity();
            o.Name = 'Test' +i; o.CloseDate = system.today(); o.StageName='Prospecting';
            lisO.add(o);
        }
        insert lisO;
        //3
        Account a = new Account();
        a.First_Name__c = 'Test1234567'; a.Phone = '1234567'; a.Name = 'test';
        insert a;
        Contact b = new Contact();
        b.Lastname = a.Name; b.Phone = a.Phone; b.AccountId= a.Id;
        insert b;
    
    	//4
    	Account d = new Account();
        d.First_Name__c = 'Test12345678'; d.Phone = '12345678'; d.Name ='Test';
        insert d;
        Contact e = new Contact();
        e.Lastname = d.Name; e.Phone = d.Phone; e.AccountId= d.Id;
        insert e;
        Opportunity f = new Opportunity();
        f.Name = 'Test12345678'; f.CloseDate = system.today(); f.StageName='Prospecting'; f.AccountId = d.Id;
        insert f; 
        //5
        List<Account> lisAcc = new List<Account>();
        for(Integer i=0;i<5;i++){
            Account a = new Account();
            a.First_Name__c = 'Sankar'+i+i; a.Phone = '1234567'; a.Name = 'test';
            lisAcc.add(a);
        }
        insert lisAcc;
        for(Account ac :lisAcc){    
        	Opportunity op = new Opportunity();
            op.CloseDate = system.today();
            op.StageName = 'Qualification';
            op.Name = ac.Name;
            op.AccountId = ac.Id;
            insert op;
        }
        update lisAcc;
        //6
        List<Account> lisAcc2 = new List<Account>();
        for(Integer i=0;i<5;i++){
            Account a2 = new Account();
            a2.First_Name__c = 'Bhavani'+i+'6'; a2.Phone = '1234567'; a2.Name = 'test';
            lisAcc2.add(a2);
        }
        insert lisAcc2;
        for(Account ac2 :lisAcc2){    
        	Opportunity op2 = new Opportunity();
            op2.CloseDate = system.today();
            op2.StageName = 'Qualification';
            op2.Name = ac2.Name;
            op2.AccountId = ac2.Id;
            insert op2;
            Contact e = new Contact();
            e.Lastname = ac2.Name; e.AccountId= ac2.Id;
            insert e;
        }
        update lisAcc2;
        ///////////////////////////////////////////////////////////////////////////
        //7
        List<Account> accList = [Select Id, Name from Account where Phone = '1234567'];
        for(Account acc : accList){
            acc.Phone = '654321';
        }
        update accList;
        
        //8
        List<Account> listiAcc = [Select Id, Name, Email__c from Account where Email__c = Null];
        for(Account ant : listiAcc){
            ant.Email__c = 'test@test.com';
        }
        
        //9
        List<Account> accList = [Select Id,Phone, Name from Account where Phone='654321'];
        system.debug(accList);
        for(Account acc : accList){
                acc.Phone='12345';
        }
        for(Integer i=0;i<5;i++){
            Account a2  = new Account();
			a2.First_Name__c = 'Bhavani'+i+'6'; a2.Phone = '1234567'; a2.Name = 'test';
            accList.add(a2);
        }
        upsert accList;
        system.debug(accList);
        //10
        List<Opportunity> oppli = [Select Id, Name from Opportunity where CreatedDate = LAST_MONTH];
        system.debug(accList);
        for(Opportunity op : oppli){
            op.StageName= 'Closed Won';
        }
        for(Integer i=0;i<5;i++){
            Opportunity opp= new Opportunity();
            opp.Name='OppoBhav1'; opp.StageName='Qualification'; opp.CloseDate= system.today();
        	oppli.add(opp);
        }
        upsert oppli;
        system.debug(accList);
        
        //11
        List<Account> accList1 = [Select Id,Phone, Name from Account where Phone='123456'];
        system.debug(accList1);
        if(!accList1.isEmpty()){
            delete accList1;
        }
        system.debug(accList1);
        //12
        List<Account> accList1 = [Select Id,Phone, Name from Account where Name like 'Test%' ALL ROWS];
        if(!accList1.isEmpty()){
            undelete accList1;
        }*/
        //13
        List<Opportunity> opplisti = [Select Id, Name, StageName from Opportunity where CreatedDate = LAST_MONTH and StageName = 'ClosedWon'];
        delete opplisti;
        
        //14
        List<Account> neA = [Select Id, Name from Account where CreatedDate = LAST_MONTH and Name like 'Th%'];
        List<Opportunity> ls = new List<Opportunity>();
        for(Account a : neA){
            Opportunity op= new Opportunity();
            op.CloseDate = system.today();
            op.StageName = 'Qualification';
            op.Name = a.Name;
            op.AccountId = a.Id;
            ls.add(op);
        }
        insert ls;
        
        //15
        Date d = system.Today()-7;
        List<Account> lisA = [Select Id, Name from Account where CreatedDate <= :  d];
        for(Account accc : lisA){
            accc.Phone = '1234567890';
        }
        update lisA;
    }
}