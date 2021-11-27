import ballerina/io;
import expressions.types as types;

public function main() {
    // Expression evaluations
    // 1. multiplicative-expr, addictive 
    int a = 10;
    int b = 15;
    int c = a + b;
    // io:println(c);

    // Record expressions scenarios
    // Record with field without nested record
    types:Pet1 pet1 = {
        id: 1,
        name: "Tommy"
    };

    // Record with field with nested record
    types:Pet2 pet2 = {
        id: 2,
        name: "Rova",
        'type: { // <- nested record 
            'type: "Dog",
            owner: {
                name: "lnash",
                address: ()
            }
        }
    };

    io:println(pet1);
    io:println(pet2);
    
    types:PetName name = "Tommy";
    io:println(name);
}

