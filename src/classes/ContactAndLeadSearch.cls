public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String name){
        List<List< SObject>> searchList = [FIND :name IN NAME Fields
                                          RETURNING Contact(Name), Lead(Name)];
        
        Contact[] searchContacts = (Contact[])searchList[0];
        Lead[] searchLeads = (Lead[])searchList[1];
        
        System.debug('Contacts: ');
        for(Contact a: searchContacts){
            System.debug(a.Name);
        }
        
        System.debug('Leads: ');
        for(Lead b: searchLeads){
            System.debug(b.Name);
        }
        
        return searchList;
    }
}