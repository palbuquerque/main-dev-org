/**
 * Created by Paul Albuquerque on 7/19/2017.
 */

public with sharing class TestApex {
    public static void sandbox(){
        List<Account> acctDelete =[SELECT Id, Name, CreatedDate FROM Account WHERE CreatedDate = TODAY];
        delete acctDelete;
        for (Account a: acctDelete) {
            System.debug(a);
        }
    }

}