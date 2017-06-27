Before running the codes, SPM and libsvm toolbox for Matlab need to be installed 
%Automated segmentation of mouse brain images using extended MRF.
%Bae MH, Pan R, Wu T, Badea A.
%Neuroimage. 2009 Jul 1;46(3):717-25. doi: 10.1016/j.neuroimage.2009.02.012. Epub %2009 Feb 21.

File list:


assign_edge_nums_lattice.m ......To assign edge numbers
calc_interaction_param.m ......calculate the init parameters
eval_accuracy.m ......Evaluate Accuracy
eval_performance.m......Evaluate Performance of the model
Gen_CV_MRS_trainset.m......generate MRS trainset
Gen_CV_set.m ......Generate testing dataset
Gen_CV_test.m
Gen_CV_test_set.m
Gen_CV_trainset.m ...... Generate the eMRF trainset
Gen_image_matrix.m ......convert .img files to matlab data matrix
Gen_matrix_mouse.m ......generate the input data matrix
Mix_over_sampling.m ...... Mixed Ratio Sampling
Gen_prior_prob_mat.m ...... Generate Prior Prob mat
ICM_eMRF_CV.m...... Main function of the eMRF model
mkInitialLabel.m
mkPriorProb.m
run_eMRF_cv.m


1. Convert Original Image files to Data Matrix:
  1.1 Run 'Gen_image_matrix.m' to convert .img files to matlab data matrix
  1.2 Run 'Gen_matrix_mouse.m' to generate the input data matrix for following procedure.

2. Prepare MRS or simple over-sampling training set.
  2.1 Run 'Gen_CV_MRS_trainset.m': using the function,this code creates the MRS training set.

3. Run 'Run_eMRF_cv.m': this code runs MRS-SVM with 5-fold CV to get the probabilistic output P(Y|X). The output of this code is 'intense_prob' which is P(Y|X)

4. Run 'calc_interaction_param.m' to get the int_param which is an input for eMRF: you need to change the file name of load in order to calculate all the samples(default one is load 'C:\SVM software\libsvm-mat-2.84-1\Data\labelr3')

5. Run 'Gen_prior_prob_mat.m' to get other 2 inputs for eMRF model: prior_prob and initLabel

6. Run the ICM to calculate P(Y|X,L)
  6.1 Run 'ICM_eMRF_CV.m': this is a code for runing the ICM with different w1,w2 and w3 using 5-fold CV.



