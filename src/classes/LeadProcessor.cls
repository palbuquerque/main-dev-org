/**
 * Created by Paul Albuquerque on 7/19/2017.
 */

global class LeadProcessor implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return  Database.getQueryLocator([SELECT LeadSource FROM Lead]);
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        for(Lead ld:scope){
            ld.LeadSource = 'Dreamforce';
        }
        update scope;
    }

    global void finish(Database.BatchableContext bc){

    }
}