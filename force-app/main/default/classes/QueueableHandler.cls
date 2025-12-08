public class QueueableHandler implements Queueable,Database.AllowsCallouts {

    public static void execute(QueueableContext qc){
        System.debug('JobId : '+qc.getJobId());
        
        List<Opportunity> opplist = [SELECT Id,StageName FROM Opportunity];
        if(!opplist.isEmpty()){
            for(Opportunity op : opplist){
                System.debug('Opp Stage  :'+op.StageName);
            }
            
        }
        test(opplist);
        
        System.enqueueJob(new SecondQueueable());
       
    }
    public static void test(List<Opportunity> opplistt){
        for(Opportunity op : opplistt){
            System.debug('Op Name : '+op.Name);
        }
        
    }
    
   
}