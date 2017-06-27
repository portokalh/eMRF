clc; clear; tic
num_class=23;result=zeros(1,2);
c1=1000; g1=10; %%%% C and gamma values
test=1;  %%%%testing set
trn='_noBl_mix9';  %%%% part of file name of training set

opt=['-c ' num2str(c1) ' -b 1 -g ' num2str(g1)]; ss1=[];   %%%% -b 1: probabilistic output
for i=1:5       
    if i~=test
        [ss] = Gen_CV_set(i,trn);
        ss1=vertcat(ss1,ss); 
    end        
end
TrainLabel=ss1(:,9); TrainMat=ss1(:,[1 2 6 7 8]); clear ss1 ss;

model = svmtrain(TrainLabel, TrainMat, opt);
save model_slr_noBl_mix9_c1000_g10_b_test1 model
clear TrainLabel TrainMat;

t1=toc/60
% load  model\model_slr_5k_test3_c1000_g10_b;
% % i=1; tot=[]; predict_label_total=[];dec_values_total=[];

[ss6, s1] = Gen_CV_test_set(test, trn);
TrueLabel=ss6(:,9); TestMat=ss6(:,[1 2 6 7 8]); clear ss6;

[predict_label, accuracy, dec_values] = svmpredict(TrueLabel, TestMat, model, ' -b 1'); 
% [predict_label, accuracy] = svmpredict(TrueLabel, TestMat, model, ' -b 0');

t2=toc/60

X=s1;ind=find(s1>0);X(ind)=predict_label;clear ind;
[TrueFalseMat2] = eval_accuracy(s1,X); 
intens_prob=zeros(2076366,23);
ind=find(s1==0); intens_prob(ind,1)=1;
ind2=find(s1~=0); intens_prob(ind2,2:23)=dec_values;

result(1,1:2)=[t1 t2];

%%%% save the predicted label('X') and the probabilistic output
%%%% ('intens_prob')
save predict_slr_noBl_mix9_c1000_g10_b_test1 X intens_prob;




