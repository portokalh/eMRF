function [s1] = Gen_CV_test(cases)

%%%%%% Twu's data
% switch cases
%    case 1      
%       load '/home/rpan/libsvm-mat-2.84-1/Data/twu_label1';
%       cases
%    case 2
%       load '/home/rpan/libsvm-mat-2.84-1/Data/twu_label2';
%       cases
%    case 3
%       load '/home/rpan/libsvm-mat-2.84-1/Data/twu_label3';     
%       cases
%    case 4
%       load '/home/rpan/libsvm-mat-2.84-1/Data/twu_label4';      
%       cases
%    case 5
%       load '/home/rpan/libsvm-mat-2.84-1/Data/twu_label5';
%       cases
%    case 6
%       load '/home/rpan/libsvm-mat-2.84-1/Data/twu_label6';
%       cases
% end


%%%%% Min's data

switch cases
   case 1      
      load 'C:\SVM software\libsvm-mat-2.84-1\Data\labelr1';
      cases
   case 2
      load 'C:\SVM software\libsvm-mat-2.84-1\Data\labelr2';
      cases
   case 3
      load 'C:\SVM software\libsvm-mat-2.84-1\Data\labelr3';     
      cases
   case 4
      load 'C:\SVM software\libsvm-mat-2.84-1\Data\labelr4';      
      cases
   case 5
      load 'C:\SVM software\libsvm-mat-2.84-1\Data\labelr5';
      cases
end