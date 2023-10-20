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

bingBong := project onHand(part);
bingBongCopy(onHand1) := bingBong;
notMinonHand := project onHand (select onHand > onHand1 (bingBong product bingBongCopy));
minOnHand := bingBong difference notMinonHand;

merger := minOnHand njoin part;
result := project partNum, description (merger);
