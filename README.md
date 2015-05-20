# ParsePFObjArrayStoreExample
example of use of PFObject with parse with a property that is an Array of Strings

Also searching works for searching Arrays of Strings in the stringArr property like this:

NSPredicate *predicate = [NSPredicate predicateWithFormat:@"stringArr == %@", @"Flintstone"];
 will search each stringArr array property of each object in the table for "Flintstone"
