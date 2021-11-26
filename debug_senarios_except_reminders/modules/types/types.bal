public type Pet record {
    int id;
    string name;
    Type 'type;
}; 

// Type can be null or record.
public type Type record {
    string 'type;
    Owner owner;
}?;

public type Owner record {
    string name;
    string[]? address;
};