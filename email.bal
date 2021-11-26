import ballerina/email;

public function main() returns error? {
    // Creates an SMTP client with the connection parameters, host, username,
    // and password. The default port number `465` is used over SSL with these
    // configurations. `SmtpConfig` can be configured and passed to this
    // client if the port or security is to be customized.
    email:SmtpClient smtpClient = check new ("smtp.email.com",
        "<email>" , "pass");

    // Defines the email that is required to be sent.
    email:Message email = {
        // "TO", "CC", and "BCC" address lists are added as follows.
        // Only the "TO" address list is mandatory out of these three.
        to: ["<email>"],
        // Subject of the email is added as follows. This field is mandatory.
        subject: "Sample Email",
        // Body content (text) of the email is added as follows.
        // This field is optional.
        body: "This is a sample email.",
        // Email author's address is added as follows. This field is mandatory.
        'from: "<email>"
    };

    // Sends the email message with the client. The `send` method can be used
    // instead, if the email is required to be sent with mandatory and optional
    // parameters instead of configuring an `email:Message` record.
    check smtpClient->sendMessage(email);

}
