/**
 * Created by Paul Albuquerque on 7/20/2017.
 */

global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx){
        List<Lead> blankLeadSource = [SELECT Id, LeadSource FROM Lead WHERE LeadSource ='' LIMIT 200];
        for(Lead ld:blankLeadSource){
            ld.LeadSource = 'Dreamforce';
        }
        update blankLeadSource;
    }
}