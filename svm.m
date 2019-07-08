Xindex=xlsread('BCT/data/Xindex.xlsx');
YAssessment=xlsread('BCT/data/Yassessment.xlsx');
for i=1:length(YAssessment)
    Y(i)=find(YAssessment(:,i)==1);
end
model = libsvmtrain(Y',Xindex');
[predict_label,accuracy,dec_values]=libsvmpredict(Y',Xindex',model);