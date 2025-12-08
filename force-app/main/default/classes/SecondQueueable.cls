public class SecondQueueable implements Queueable{

    public static void execute(QueueableContext qc){
      
        System.debug('Job ID '+qc.getJobId());
    }
}