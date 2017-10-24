/**
 * Created by Paul Albuquerque on 7/19/2017.
 */
@isTest
public class AddPrimaryContactTest {
    @TestSetup
    static void setup(){
        List<Account> nyAccts = new List<Account>();
        List<Account> caAccts = new List<Account>();
        for (Integer i = 0; i < 50; i++) {
            Account ny = new Account(Name = 'NY Account ' + i, BillingState = 'NY');
            Account ca = new Account(Name = 'CA Account ' + i, BillingState = 'CA');
            nyAccts.add(ny);
            caAccts.add(ca);
        }
        insert nyAccts;
        insert caAccts;
        Contact nyCnt = new Contact(LastName = 'New York');
        Contact caCnt = new Contact(LastName = 'California');
        insert nyCnt;
        insert caCnt;
    }
    @isTest
    static void testQueueable(){
        Contact nyCnt = [SELECT LastName FROM Contact WHERE LastName = 'New York' LIMIT 1];
        Contact caCnt = [SELECT LastName FROM Contact WHERE LastName = 'California' LIMIT 1];
        AddPrimaryContact ny = new AddPrimaryContact(nyCnt, 'NY');
        AddPrimaryContact ca = new AddPrimaryContact(caCnt, 'CA');
        Test.startTest();
        System.enqueueJob(ny);
        System.enqueueJob(ca);
        Test.stopTest();
    }

}