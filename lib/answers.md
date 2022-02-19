

# 4. Object comparison:
 ```dart
final a1 = Author('Dash', 21);
final a2 = Author('Dash', 21);
```
 Is `a1 == a2` `true` or `false`? Ask the candidate to explain why

 ### Answer 

 At this moment it will return false.
 It is bacause we compare a memory location instead of object properties values.
 We should extend the Author class by Equatable and add props.
 Then We will be able to compare values, and then the statement is true.

 