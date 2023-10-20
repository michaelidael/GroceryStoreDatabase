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

ez :=  select branchNum = 4  (inventory);

%according to the question, this query shows all the possible bookCodes, at branch #4, with no duplicates nor same bookCode twice.
%the solution output has a bookCode2 that was not specified to do. 
%roughans := project bookCode (ez);
%selections := project onHand (ez);
%multiplications := roughans product selections;
%results := project bookCode (multiplications);


temp1 := project bookCode (select branchNum = 4 (inventory));
temp2 := project onHand ( select onHand >=1  (inventory));
multiplication := temp1 product temp2;
