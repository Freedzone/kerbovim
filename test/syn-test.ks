// Kerboscript vim syntax test file
// Program itself does not have any practical purpose

//////////////////////////////////////////////////
// Positive tests (SHOULD HIGHLIGHT)
//////////////////////////////////////////////////
@LAZYGLOBAL on.

// Numbers formats
set num to list(
        12345678, 12_345_678,
        -12345.6789, 12_345.6789,
        -12345678, -1.123e12, 1.234e-12).

// Boolean constants
// TODO: test
declare global bool is true.
local bool to false.
RCS on.

// Flow
set x to choose 5 if bool else constant:Avogadro.
set myValue to (x > 10 and x <= 99).
if myValue or x = 10 {
    print "x is a two digit number.".
}
else {
    print "x is not".
}

wait until not core:messages:empty. // make sure we've received something
set received to core:messages:pop.
if received:content = "undock" {
    print "undocking!!!".
        undock().
} else {
    print "unexpected message: " + received:content.
}

// Triggers
when(alt:radar > 200) then {
    set nd to nextnode.

    setModen(nd).
}.

on ag10 set x to 5.
on (x = 5)
{
    set x to 5.
}

// Builtins
list parts in mylist.
print mylist:length. // length is a suffix of mylist

// Methods
set x to ship:partsnamed("rtg").
print x:length().
x:remove(0).
x:clear().

// Functions
declare local function test { return 0. }

global function print_corner
{
    parameter mode.
    parameter text.

    local row is 0.
    local col is 0.

    if mode = 2 or mode = 4 {
        set col to terminal:width - text:length.
    }
    if mode = 3 or mode = 4 {
        set row to terminal:height - 1.
    }

    print text at (col, row).
}

function test3 {
    declare parameter p1, p2, p3 is 0, p4 is "cheese".
    declare parameter test.
    parameter y.
    print "X times Y is " + X*Y.
    return false.
}

for val in num {
    set sum to sum + val.
}

// Anonymouse func and Delegates
set aaa to myfunc@.
print aaa(1, 2).

set deleg to {
    return 3+3.
}.

set deleg2 to
{
    return 3+3.
}.

// Variables
if defined var1 {
    print "var1 exists".
} else {
    print "var1 doesn't exist".
}

local var1 is 0.
// But now it prints that it does exist:
if defined var1 {
    print "var1 exists".
} else {
    print "var1 doesn't exist".
}

//////////////////////////////////////////////////
// Negative tests (SHOULD NOT HIGHLIGHT)
//////////////////////////////////////////////////
// Keywords should not highlight in suffixes
set steeringmanager:set to 0.
set steeringmanager:declare to 0.
set steeringmanager:function to 0.
// Constanst should not highlight in suffixes
set ship:constant:g to 10.

// Invalid numbers
set num to list(12a, 12.4e-, 1.2.3.4).

// Not ON statement, but function
on(as).

// vim: set sw=4 sts=4 ts=4
