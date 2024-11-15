public class day35of2 {
    public static void pouint2to5(){
        /*List<Account> liststype = new List<Account>();
        Account a = new Account(Name= 'poutn199',Active__c='true', Rating='Hot');
        liststype.add(a);
        Account a1 = new Account(Name= 'poutn191',Active__c='true', Rating='Hot');
        liststype.add(a1);
        insert liststype;
        system.debug(liststype);
        
        List<Position__c> posList = new List<Position__c>();
        Position__c pos1 = new Position__c(Name = 'Manager110');
        Position__c pos3 = new Position__c(Name = 'Manager0101');
        posList.add(pos1);
        insert posList;
        system.debug(posList); */
        
        //4
        system.debug([Select Id, Name, Rating, Active__c from Account limit 10]);
        //5
        system.debug([select Name, Status__c from Position__c where Status__c ='New' limit 10]);
    }
}