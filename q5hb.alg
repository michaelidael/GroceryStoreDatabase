%========================================================
% Name: Michael Soto
% Panther-ID: x x x - 8769
% Course: CGS 4307
% Assignment#: 4
% Due: before end of semester
% I hereby certify that this work is my own and none of
% it is the work of any other person.
% Signature: Michael Soto
% ======================================================= 
bookz := project bookCode, title, price (book);
branch1 :=  project branchNum, branchName (branch);
 yerr := project bookCode, branchNum (inventory);
 

 joining :=  bookz njoin branch1;

 joining2 := yerr njoin joining;

 mathy := select (price >20) (joining2);
 result := project title, branchName (mathy);