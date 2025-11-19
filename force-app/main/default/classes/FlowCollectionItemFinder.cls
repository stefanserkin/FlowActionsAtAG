/**************************************************************
 * @description Return an sobject from a collection of sobjects in flow
 * @date 2024
 **************************************************************/
public with sharing class FlowCollectionItemFinder {

    @InvocableMethod(
        label='Get sObject by Record Id' 
        category='Utilities' 
        iconName='resource:asgr__agGlyph:Layer_1'
    )
    public static List<Result> getSObjectById(List<Request> requests) {
        List<Result> results = new List<Result>();

        for (Request req : requests) {
            Result result = new Result();
            
            Map<Id, SObject> mapSObjects = new Map<Id, SObject>(req.collection);
            if (mapSObjects.containsKey(req.recordId)) {
                result.record = mapSObjects.get(req.recordId);
            }
            results.add(result);
        }

        return results;
    }

    public class Request {
        @InvocableVariable(label='Collection')
        public List<SObject> collection;

        @InvocableVariable(label='Record Id')
        public Id recordId;
    }

    public class Result {
        @InvocableVariable(label='Record')
        public SObject record;
    }

}