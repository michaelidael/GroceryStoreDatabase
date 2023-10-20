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
 
tempCust := project customerNum, customerName (customer);
 comboJawn :=  (tempCust njoin orders);

 tempPart := project partNum, class (part);
 tempOrdLin := project orderNum, partNum(orderLine);
 comboJawn2 := ( tempPart njoin tempOrdLin);

 comboJawn3 := (comboJawn njoin comboJawn2);
 filter := select ((class = 'HW') or (class = 'SG')) (comboJawn3);
 result := project customerName, orderDate (filter);