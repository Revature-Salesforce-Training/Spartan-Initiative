public with sharing class YoutubeCommentMonitorController {
    /**
     * Reis Taylor
     * Last Modified: May 30th 2022
     *  
     * 1.) Access Base URL of specific Youtube video
     * 2.) Inisialized Map three necessary key value pairs
     *     -Required key (part) with the data required from API (snippet)
     *     -(videoId) and Youtube video Id (iLKHd7DEWRA) 
     *     -(key) to specify authorization value (AIzaSyDVa0qAwR19795ZkrNPunAKMNVdJnqvfIs)
     * 3.) Conditional logic to programmatically apend Base URL 
     *     with: ?part=snippet&videoID=hiLKHd7DEWRA&key=AIzaSyDVa0qAwR19795ZkrNPunAKMNVdJnqvfIs
     * 4.) Parts #2 and #3 were not necessary, but it makes the code more dynamic and reusable.
     * 5.) Initializes a Map called responseObject with key:value pairs of type String/Object
     * 6.) Lines 43 through 67 comprise a loop with its iterator properly decoupled. 
     *     each iteration of the loop performs the necessary casting and recasting to drill down 
     *     into the JSON object that was required to obtain the Youtube comments.
     * 
     * 7.) getCalloutResponse() is a reasonably boilerplate http callout method
     * 8.) getComments() is method bound to Visualforce page -- it returns the 
     *     getRecentYoutubeComments() method, which returns a List<String> comments
     *  
     */
    public static List<String> getRecentYoutubeComments () {
        
        String baseURL = 'https://www.googleapis.com/youtube/v3/commentThreads';
        
        Map<String,String> youtubeQueryParams = new Map<String,String> {
            'part'    => 'snippet',
            'videoId' => 'iLKHd7DEWRA',
            'key'     => 'AIzaSyDVa0qAwR19795ZkrNPunAKMNVdJnqvfIs'
        };

        String finalURL = baseURL;
        Integer i = 0;

        for (String queryParam : youtubeQueryParams.keySet()) {
            if (i == 0) {
                finalURL += '?' + queryParam + '=' + youtubeQueryParams.get(queryParam);
                i++;
            } else {
                finalURL += '&' + queryParam + '=' + youtubeQueryParams.get(queryParam);
            }
        }

        Map<String, Object> responseObject =  (Map<String, Object>)getCalloutResponseContents(finalURL);
        
        List<Object> items = ( List<Object>)responseObject.get('items');
        

        // This will be our return value. All we care about in this method, is the 10 comments for this video.
        List<String> comments      = new List<String>();
        Integer numCommentsToStore = 10;
        i = 0;
        for(Object obj : items) {
            if(i == 0) {
                i++;
                continue;
            }
            // 0 (or items{i})
            Map<String, Object> itemObj         = (Map<String, Object>) obj;
            // snippet
            Map<String, Object> snippetObj      = (Map<String, Object>) itemObj.get('snippet');
            // topLevelComment
            Map<String, Object> topLevelComment = (Map<String, Object>)snippetObj.get('topLevelComment');
            // snippet (2nd)
            Map<String, Object> finalSnippetObj = (Map<String, Object>)topLevelComment.get('snippet');
            // Getting the final value we want
            String comment = (String)finalSnippetObj.get('textDisplay');
            comments.add(comment);

           if(i >= numCommentsToStore) {
               break; 
           }
           i++;
        }

        System.debug('comments returned: ' + comments);
        return comments;
    }
    
    public static List<String> getComments() {
        
        return getRecentYoutubeComments();
    }

    // Pass in the endpoint to be used using the string url
  public static Object getCalloutResponseContents(String url) {


    // Instantiate a new Salesforce default http object
    Http h = new Http();

    // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint(url);
    req.setMethod('GET');

    // Send the request, and return a response
    HttpResponse res = h.send(req);
    //system.debug('status code: ' + res.getStatusCode()); //to display the Http response code
    //system.debug('body: ' + res.getBody());//contains usable data in JSON
    //system.debug('entire HTTP/JSON response: ' + res);

    //JSON object calling a class method
    return JSON.deserializeUntyped(res.getBody());
  }

}