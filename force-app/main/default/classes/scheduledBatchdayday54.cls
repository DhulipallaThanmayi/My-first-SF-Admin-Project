public with sharing class scheduledBatchdayday54 implements DataBase.Batchable<Opportunity>, DataBase.stateful{

    Integer count = 0;

    public Iterable<Opportunity> start(DataBase.BatchableContext bc) {
        return new List<Opportunity>([SELECT Id, Name,LeadSource FROM Opportunity]);
    }

    public void execute(DataBase.BatchableContext bc, List<Opportunity> oppList) {
        for(Opportunity opp :oppList){
            opp.LeadSource = 'Dreamforce';
        }
        update oppList;
        count  = count + oppList.size();
    }

    public void finish(DataBase.BatchableContext bc) {
        System.debug('Total records :'+count);
    }
}