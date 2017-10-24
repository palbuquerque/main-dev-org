/**
 * Created by Paul Albuquerque on 7/20/2017.
 */
@isTest
public with sharing class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    private static List<Lead> leads = new List<Lead>();
    @TestSetup
    static void setup(){
        for (Integer i = 0; i < 200; i++) {
            Lead ld = new Lead(LastName = 'Test Lead ' + i, Company = 'Test Co.');
            leads.add(ld);
        }
        insert leads;
    }

    @isTest
    static void test(){
        Map<Id,Lead> processLeads = new Map<Id, Lead>(leads);
        List<Id> leadIds = new List<Id>(processLeads.keySet());

        Test.startTest();
        String jobId =  System.schedule('ScheduleApexTest',CRON_EXP,new DailyLeadProcessor());
        List<task> processTasks = [SELECT Id FROM Task WHERE WhatId IN :leadIds];
        System.assertEquals(0,processTasks.size(),'Tasks exist before job has run');
        Test.stopTest();

        processTasks = [SELECT Id FROM Task WHERE WhatId IN :leadIds];
        System.assertEquals(leadIds.size(),processTasks.size(),'Tasks were not created');

    }
}