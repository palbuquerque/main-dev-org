/**
 * Created by palbu on 6/26/2017.
 */

trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Opportunity> oppList = [SELECT Id, StageName FROM Opportunity WHERE Id IN :Trigger.new AND StageName = 'Closed Won'];
    List<Task> tasksToAdd = new List<Task>();
    for (Opportunity opp : oppList){
        Task t = new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id);
        tasksToAdd.add(t);
    }
    insert tasksToAdd;
}