public class ContactSearch {
    public static List<Contact> searchForContacts(String lName, String postal){
        List<Contact> searchList = [SELECT FirstName, LastName, MailingPostalCode
                                    FROM Contact 
                                    WHERE LastName = :lName AND MailingPostalCode = :postal];
        return searchList;
    }
}