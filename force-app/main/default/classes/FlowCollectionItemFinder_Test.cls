@IsTest
private class FlowCollectionItemFinder_Test {

    private static FlowCollectionItemFinder.Request request = new FlowCollectionItemFinder.Request();
    private static List<FlowCollectionItemFinder.Request> requests = new List<FlowCollectionItemFinder.Request>();
    private static List<FlowCollectionItemFinder.Result> results;

    @IsTest
    static void testGetSObjectById() {
        List<Account> accounts = FlowTestUtility.getAccounts(10);
        Account accToFind = accounts[1];

        request.collection = accounts;
        request.recordId = accToFind.Id;
        requests.add(request);

        Test.startTest();
        results = FlowCollectionItemFinder.getSObjectById(requests);
        Test.stopTest();

        System.Assert.areEqual(accToFind, results[0].record, 'Received incorrect account record');
    }

    @IsTest
    static void testRecordNotFound() {
        List<Account> accounts = FlowTestUtility.getAccounts(10);

        // Create additional account that is not in the collection
        Account accToFind = FlowTestUtility.getAccounts(1).get(0);

        request.collection = accounts;
        request.recordId = accToFind.Id;
        requests.add(request);

        Test.startTest();
        results = FlowCollectionItemFinder.getSObjectById(requests);
        Test.stopTest();

        System.Assert.isNull(results[0].record, 'Should have received a null value for the returned record');
    }

}