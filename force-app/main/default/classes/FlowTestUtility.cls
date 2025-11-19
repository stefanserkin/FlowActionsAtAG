@IsTest
public class FlowTestUtility {

    static Integer idIncrement = 1;

    public static Id getFakeId(Schema.SObjectType sObjectType) {
		String result = String.valueOf(idIncrement++);
		return (Id) (sObjectType.getDescribe().getKeyPrefix() +
            '0'.repeat(12 - result.length()) +
            result);
	}

    public static List<Account> getAccounts(Integer numberOfAccounts) {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < numberOfAccounts; i++) {
            accounts.add( 
                new Account(Id = getFakeId(Account.SObjectType), Name = 'Testeroodle ' + String.valueOf(i))
            );
        }
        return accounts;
    }
    
}