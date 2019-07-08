Xindex=xlsread('BCT/data/Xindex.xlsx');
YAssessment=xlsread('BCT/data/Yassessment.xlsx');
for i=1:length(YAssessment)
    Y(i)=find(YAssessment(:,i)==1);
end
Y=Y';
nTree=50;
factor=TreeBagger(nTree,Xindex',Y,'OOBPred','on','NVarToSample','all',...
    'Method','regression','Surrogate','on',...
    'PredictorSelection','curvature','OOBPredictorImportance','on');
plot(oobError(factor))
view(factor.Trees{1},'mode','graph')
xlabel('number of grown trees')
ylabel('out-of-bag classification error')
[Predict_label,Scores] = predict(factor, Xindex'); 
MZE = mean(round(cell2mat(Predict_label)) ~= Y(:,end))
MAE = mean(abs(round(cell2mat(Predict_label)) - Y(:,end)))

