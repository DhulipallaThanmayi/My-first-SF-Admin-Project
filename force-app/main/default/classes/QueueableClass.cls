/*You have a business requirement where you need to:
1. Assign Leads to specific owners based on criteria in the related Opportunity records.
2. Calculate the total value of Opportunities related to each Lead and store this in a 
custom field on the Lead.
3. Ensure high performance: The batch should handle cases where there are thousands of 
Leads and their related Opportunities.
*/
public with sharing class QueueableClass implements QueueableContext{

    private List<Lead> listLead;

    public QueueableClass(List<Lead> lisL) {
        this.listLead = lisL;
    }

    public void execute(QueueableContext){
        for(Lead le : listLead){
            List<Opportunity> oppLi = [Select Id ]
        }
    } 
}