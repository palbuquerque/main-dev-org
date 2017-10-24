/**
 * Created by palbu on 7/18/2017.
 */
@isTest
public class TestVerifyDate {

    @isTest static void dateTwoChanged(){
        Date date1 = Date.today();
        Date date2 = date1 + 35;
        Date endOfMonth = Date.newInstance(date1.year(), date1.month(), Date.daysInMonth(date1.year(), date1.month()));
        Date check = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(check, endOfMonth);
    }

    @isTest static void dateTwoNotChanged(){
        Date date1 = Date.today();
        Date date2 = date1 + 15;
        Date check = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(check, date2);
    }

}