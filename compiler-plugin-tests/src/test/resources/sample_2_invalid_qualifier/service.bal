import ballerinax/salesforce as sfdc;
import ballerina/io;


sfdc:ListenerConfiguration listenerConfig = {
   username: "<USER_NAME>",
   password: "<PASSWORD>"
};
listener sfdc:Listener eventListener = new (listenerConfig);

@sfdc:ServiceConfig {
    channelName:"/data/ChangeEvents"
}
service on eventListener {
    resource function onCreate(sfdc:EventData quoteUpdate) {
        json quote = quoteUpdate.changedData.get("Status");
        io:println("Quote Status : ", quote);
    }
}