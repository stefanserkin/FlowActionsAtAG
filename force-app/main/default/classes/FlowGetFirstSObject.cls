/**************************************************************
 * @description Return an sobject from a collection of sobjects in flow
 * @date 2024
 **************************************************************/
public with sharing class FlowGetFirstSObject {

    @InvocableMethod(
        label='Get First SObject' 
        category='Utilities' 
        iconName='resource:asgr__agGlyph:Layer_1'
    )
    public static List<Result> getFirstSObject(List<Request> requests) {
        List<Result> results = new List<Result>();
        for (Request request : requests) {
            Result result = new Result();
            if (!request.records.isEmpty()) {
                result.firstRecord = request.records[0];
            }
            results.add(result);
        }
        return results;
    }
    
    public class Request {
        @InvocableVariable(label='Record Collection' required=true)
        public List<SObject> records;
    }

    public class Result {
        @InvocableVariable(label='First Record')
        public SObject firstRecord;
    }

}