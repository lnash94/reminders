import ballerina/io;
import debug_senarios_except_reminders.types as 'type;
public function main() {
    // Expression evaluations
    // 1. multiplicative-expr
    int a = 10;
    int b = 15;
    int c = a + b;
    io:println(c);

    // Record expressions scenarios
    'type:Pet pet1 = {
        id: 1,
        name: "Rova",
        'type: ()
    };

    io:println(pet1);
}

