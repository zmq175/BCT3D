Xindex=xlsread('BCT/data/Xindex.xlsx');
YAssessment=xlsread('BCT/data/Yassessment.xlsx');
for i=1:length(YAssessment)
    Y(i)=find(YAssessment(:,i)==1);
end
[idx,C]=kmeans(Xindex',4);
correct=0;
for i=1:length(Y)
    if Y(1,i)==idx(i,1)
        correct=correct+1;
    end
end
accuracy=correct/length(Y)