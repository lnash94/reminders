// These types are in separate module type
// Record with field primitive type
public type Pet1 record {
    int id;
    string name;
}; 

//Record with field has record type
public type Pet2 record {
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

public type PetName string;