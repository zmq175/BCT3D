Xindex=xlsread('BCT/data/Xindex.xlsx');
YAssessment=xlsread('BCT/data/Yassessment.xlsx');
for i=1:length(YAssessment)
    Y(i)=find(YAssessment(:,i)==1);
end
Assessment = Y';
Xindex=Xindex';
volume_difference = categorical(Xindex(:,1));
local_reduction = categorical(Xindex(:,2));
pBOD = categorical(Xindex(:,3));
pLBC = categorical(Xindex(:,4));
pUNR = categorical(Xindex(:,5));
nipple = categorical(Xindex(:,6));
skin_pigmentation_area_difference = categorical(Xindex(:,7));
scar_area = categorical(Xindex(:,8));
X = table(volume_difference,local_reduction,pBOD,pLBC,pUNR,nipple,...
    skin_pigmentation_area_difference,scar_area,Assessment);
rng('default');
Mdl = TreeBagger(200,X,'Assessment','Method','Classification','Surrogate','on',...
    'PredictorSelection','curvature','OOBPredictorImportance','on');
imp = Mdl.OOBPermutedPredictorDeltaError;
figure;
bar(imp);
title('Curvature Test');
ylabel('Predictor importance estimates');
xlabel('Predictors');
h = gca;
h.XTickLabel = Mdl.PredictorNames;
h.XTickLabelRotation = 45;
h.TickLabelInterpreter = 'none';

MdlCART = TreeBagger(200,X,'Assessment','Method','Classification','Surrogate','on',...
    'OOBPredictorImportance','on');

impCART = MdlCART.OOBPermutedPredictorDeltaError;

figure;
bar(impCART);
title('Standard CART');
ylabel('Predictor importance estimates');
xlabel('Predictors');
h = gca;
h.XTickLabel = Mdl.PredictorNames;
h.XTickLabelRotation = 45;
h.TickLabelInterpreter = 'none';

MdlRF = TreeBagger(200,X,'Assessment','Method','Classification','OOBPredictorImportance',...
    'On');
impRF = MdlRF.OOBPermutedPredictorDeltaError;
figure;
bar(impRF);
title('Random Forest');
ylabel('Predictor importance estimates');
xlabel('Predictors');
h = gca;
h.XTickLabel = Mdl.PredictorNames;
h.XTickLabelRotation = 45;
h.TickLabelInterpreter = 'none';