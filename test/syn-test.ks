// Kerboscript vim syntax test file
// The program itself does not have any practical purpose
// Do not try to run it

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
declare global boolVar is true.
local boolVar to false.
RCS on.

// Flow
set x to 1.
until 0 {
    set x to x + 1.
    if x > 10 { break. } // Exits the loop when
                         // X is greater than 10
    // An if-else ladder:
    if x = 0 {
        print "ZERO".
    } else if x < 0 {
        print "NEGATIVE".
    } else {
        print "POSITIVE".
    }
    set x to 1.

    lock y to x + 2.
    print y.         // Outputs 3
    set x to 4.
    print y.         // Outputs 6
}

wait until not core:messages:empty. // make sure we've received something
set received to core:messages:pop.
if received:content = "undock" {
    print "undocking!!!".
    undock().
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

// GUI tests
set g:skin:font to "PT Mono Bold".
set g:skin:toggle:textcolor to rgb(1,1,1).
set g:skin:toggle:on:textcolor to rgb(0.5,1,0).
set g:skin:toggle:hover_on:textcolor to g:skin:toggle:on:textcolor.
set g:skin:toggle:height to 20.
set g:skin:button:textcolor to rgb(1,1,1).
set g:skin:button:on:textcolor to rgb(0.5,1,0).
set g:skin:popupmenu:textcolor to rgb(0.5,1,0).
set g:skin:popupmenuitem:textcolor to rgb(1,1,1).
set g:skin:textfield:textcolor to rgb(0.3,1,0).
set style_label_compact:textcolor to rgb(1,1,1).

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
