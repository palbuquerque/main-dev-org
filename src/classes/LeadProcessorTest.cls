/**
 * Created by Paul Albuquerque on 7/19/2017.
 */
@isTest
public with sharing class LeadProcessorTest {
    @testSetup
    static void setup(){
        List<Lead> leadList = new List<Lead>();
        for(Integer i = 0; i<200; i++){
            Lead l = new Lead(LastName = 'Test Lead ' + i, Company = 'Test Co.');
            leadList.add(l);
        }
        insert leadList;
    }
    @isTest
    static void test(){
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}