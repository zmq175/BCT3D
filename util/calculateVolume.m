function vol = calculateVolume(v,f,A,C)
fv.faces=f;fv.vertices=v;
bw=[];
for i=min([A(2) C(2)]):max([A(2) C(2)])
    try
        lin=intersectPlaneSurf(fv,[0,i,0],[0,1,0]);
    catch
        continue
    end
    try
        lin = connectLin(lin,true);
    catch
        lin = cell2mat(lin);
    end
    lin_bw = poly2mask(abs(lin(1,:)),abs(lin(3,:)),256,256);
    bw(:,:,end+1)=lin_bw;
end
[node,elem,face]=vol2mesh(bw>0.05,1:size(bw,1),1:size(bw,2),...
    1:size(bw,3),2,2,1,'cgalmesh');
vol=sum(elemvolume(node(:,1:3),elem(:,1:4)));