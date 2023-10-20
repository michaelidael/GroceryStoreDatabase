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
authorjugg := project authorNum, authorLast, authorFirst (author); 

booksy1 := project bookCode, publisherCode (book);
written := project bookCode, authorNum (wrote);

bookanwritten := booksy1 njoin written;

joinin := bookanwritten njoin authorjugg;
result := select publisherCode = 'JP' (joinin);
answer := project authorLast, authorFirst (result);

