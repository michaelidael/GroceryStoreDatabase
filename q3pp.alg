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

 idk := project orderNum, partNum (orderLine);
 idk2 := project partNum (select partNum = 'DR93' or partNum = 'KT03' (part));
 
orderLineOrderNu := project orderNum (idk);
outputOrderNu := project orderNum ((orderLineOrderNu product idk2) difference idk);
resultado := orderLineOrderNu difference outputOrderNu;
temp := project customerName (customer);
joining := temp njoin resultado;
printf := project customerName (joining);
