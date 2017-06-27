function [intens_prob, prior_prob, new_X, int_param] = Gen_CV_trainset(cases)

%%% k=index of the test set

switch cases
   case 1
      load data\predict_slr_mix9_cv_test1_c1000_g10_b_mod.mat;
      load data\prior_prob_test#1;
      load data\InitLabel_test#1; 
      load data\int_param_test#1;
   case 2
      load data\predict_slr_mix9_cv_test2_c1000_g10_b_mod.mat;
      load data\prior_prob_test#2;
      load data\InitLabel_test#2;
      load data\int_param_test#2;
   case 3
%      load 'C:\SVRF\data\old 5k\predict_slr_5k_test3_c1000_g10_b_mod.mat';
      load data\predict_slr_mix9_cv_test3_c1000_g10_b_mod.mat;
      load data\prior_prob_test#3;
      load data\InitLabel_test#3;  
      load data\int_param_test#3;
   case 4
      load data\predict_slr_mix9_cv_test4_c1000_g10_b_mod.mat;
      load data\prior_prob_test#4;
      load data\InitLabel_test#4;
      load data\int_param_test#4;
   case 5
      load data\predict_slr_mix9_cv_test5_c1000_g10_b_mod.mat;
      load data\prior_prob_test#5;
      load data\InitLabel_test#5;
      load data\int_param_test#5;
end



% switch cases
%    case 1
%       load data\predict_slr_5k_test1_c1000_g10_b
%        load data\prior_prob_test#1;
%       load data\InitLabel_test#1;   
%    case 2
%        load data\predict_slr_5k_test2_c1000_g10_b
%       load data\prior_prob_test#2;
%       load data\InitLabel_test#2;
%    case 3
%        load data\predict_slr_5k_test3_c1000_g10_b
%       load data\prior_prob_test#3;
%       load data\InitLabel_test#3;      
%    case 4
%        load data\predict_slr_5k_test4_c1000_g10_b
%       load data\prior_prob_test#4;
%       load data\InitLabel_test#4;      
%    case 5
%        load data\predict_slr_5k_test5_c1000_g10_b
%       load data\prior_prob_test#5;
%       load data\InitLabel_test#5;             
% end

