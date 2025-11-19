@IsTest
private class FlowGetFirstSObject_Test {

    private static FlowGetFirstSObject.Request request = new FlowGetFirstSObject.Request();
    private static List<FlowGetFirstSObject.Request> requests = new List<FlowGetFirstSObject.Request>();
    private static List<FlowGetFirstSObject.Result> results;
    
    @IsTest
    static void testGetFirstSObject() {
        List<Account> accounts = FlowTestUtility.getAccounts(5);
        request.records = accounts;
        requests.add(request);

        Test.startTest();
        results = FlowGetFirstSObject.getFirstSObject(requests);
        Test.stopTest();

        System.Assert.areEqual(
            accounts[0].Id, 
            results[0].firstRecord.Id, 
            'Should have received the first account in the list'
        );
    }

    @IsTest
    static void testGetFirstSObjectFromEmptyList() {
        List<Account> accounts = new List<Account>();
        request.records = accounts;
        requests.add(request);

        Test.startTest();
        results = FlowGetFirstSObject.getFirstSObject(requests);
        Test.stopTest();

        System.Assert.isNull(
            results[0].firstRecord, 
            'The first record property should have been null'
        );
    }

}