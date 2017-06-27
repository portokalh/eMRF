clear;clc;tic
nstates=23; nr=111; nc=94; nl=199; overlap=[]; diff=[];ii=1;

w1=.2; w2=.5; w3=1-w1-w2; %%% Specify w1 and w2

for cases=1:5
    cases
%     load data\predict_slr_s1_C5000_g10_b_modify
    [intens_prob, prior_prob, X] = Gen_CV_trainset(cases);    

    %%%%%%%%%%%%%% Calculate initial probability
    prob=zeros(nr,nc,nl);
    for l=1:nl    
        for r=1:nr
          for c=1:nc
            i = sub2ind([nr nc nl], r, c,l);       
            [edgeEnds,nedge]=assign_edge_nums_lattice(r, c, l, nr,nc,nl);
    %             [edgeEnds,nedge]=assign_edge_nums_lattice(4,5,6, nr,nc,nl);
            for ed=1:nedge
                  r2 = edgeEnds(ed,4); c2 = edgeEnds(ed,5); l2 = edgeEnds(ed,6);                    
                  Xj(ed)=X(r2,c2,l2);                
            end        
            xi=X(r,c,l);
            prob(r,c,l)=w1*intens_prob(i,xi)+w2*prior_prob(i,xi)+w3*length(find(Xj==xi))/nedge;            
          end  %%% c      
        end %%%c         
    end  %%% l   

    %%%%%%%%%%%%%% Calculate new probability & Update
    chg=10;iter=1; 
    while chg>0 
        chg=0;
        e=1;
        for l=1:nl    
            for r=1:nr
              for c=1:nc
                i = sub2ind([nr nc nl], r, c,l);       
                [edgeEnds,nedge]=assign_edge_nums_lattice(r, c, l, nr,nc,nl);
                for ed=1:nedge
                      r2 = edgeEnds(ed,4); c2 = edgeEnds(ed,5); l2 = edgeEnds(ed,6);                    
                      Xj(ed)=X(r2,c2,l2);                
                end

                prob_possible=zeros(nstates,1);
                for xi=1:nstates                
                    prob_possible(xi,1)=w1*intens_prob(i,xi)+w2*prior_prob(i,xi)+w3*length(find(Xj==xi))/nedge;               
                end
                max_prob=max(prob_possible);            
                if prob(r,c,l)< max_prob
                    ind=find(prob_possible==max_prob);
                    X(r,c,l)=ind(1);  
                    prob(r,c,l)= max_prob;     
                    chg=chg+1;
                end
              end  %%% c      
            end %%%rc         
        end  %%% l   
        if mod(iter,10)==0
            label=X-1;            
        end
        toc/60
        disp('ICM iteration='); disp(iter); iter=iter+1;
        disp('Number of chanes='); disp(chg); 
        [AVOP AVDP] = eval_performance(cases, X);
        disp('AVOP='); disp(AVOP); disp('AVDP='); disp(AVDP);
    end  %%% while

    [s1] = Gen_CV_test(cases);
    [TrueFalseMat] = eval_accuracy(s1,X-1);
    overlap(ii,:)=TrueFalseMat(5,:);
    diff(ii,:)=TrueFalseMat(6,:);
    t1=toc/60
    ii=ii+1;
end %% cases


