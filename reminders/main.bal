import ballerina/io;
import ballerina/email;
import reminders.senders as send;
import ballerina/time;
import ballerina/task;
import ballerina/lang.runtime;

string reciverEmail = "<email>";
// Job for one time reminder
class Job {
    *task:Job;
    int i = 1;
    public function execute() {
        self.i += 1;
        email:SmtpClient smtpClient = checkpanic new ("smtp.email.com", "<email>", "<password>");
        email:Message email = generateEmailContex(reciverEmail, "One time remider Email", "This is a sample email for one time remider.");
        checkpanic smtpClient->sendMessage(email);
        io:println("MyCounter: ", self.i);
    }

    isolated function init(int i) {
        self.i = i;
    }
}

# One time reminder
public function onetimeReminder() returns error? {
    time:Utc currentUtc = time:utcNow();
    time:Utc newTime = time:utcAddSeconds(currentUtc, 3);
    time:Civil time = time:utcToCivil(newTime);
    //Object init call via new Job class
    task:JobId result = check task:scheduleOneTimeJob(new Job(0), time);
    runtime:sleep(5);
    return;
}

public function main() {

    // Basic scenarios test in debugging 
    // This unused vaiable added for check conditional break point in line 12 (i%2==0)
    int i = 2;

    // 1. Store sender email address in variable
    send:sender senderEmail = "<email>";
    email:SmtpClient|error smtpClient = new ("smtp.email.com", senderEmail, "<password>");

    // 2. Store revicers email address in variable and function call
    email:Message email = generateEmailContex(reciverEmail, "Sample Email", "This is a sample email.");

    if smtpClient is email:SmtpClient {
        email:Error? sendMessage = smtpClient->sendMessage(email);
        if sendMessage is error {
            io:println("Email hasn't been sent succesfully.");
        } else {
            io:println("Email has been sent successfully.");
        }
    } else {
        io:println("Error occure while sending");
    }

    //Scenario 01 one time reminder 
    error? onetimeReminderResult = onetimeReminder();
}

# This functions is used to genarete email function body.
#
# + reciver - Parameter Description  
# + title - Parameter Description  
# + body - Parameter Description
# + return - Return Value Description  
public function generateEmailContex(string reciver, string title, string body) returns email:Message {
    email:Message email = {
        to: [reciver],
        cc: ["<email>"],
        subject: title,
        body: body,
        'from: "<email>",
        sender: "<email>"
    };
    return email;
}
