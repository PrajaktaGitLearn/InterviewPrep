public class BatchApexHandler implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext bc){
        //retrieving
        String query = 'SELECT Id,Name FROM Account WHERE Name';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc,List<Account> scope){
        //processing
        for(Account ac : scope){
            System.debug('Account Name : '+ac.Name);
        }
        
    }
    public void finish(Database.BatchableContext bc){
        // post porocessin logic
        
    }
}