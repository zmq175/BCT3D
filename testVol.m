fv_2.faces=f3;fv_2.vertices=v3;
bw=[];
for i=min([A(2) C(2)]):max([A(2) C(2)])
    try
        lin=intersectPlaneSurf(fv_2,[0,i,0],[0,1,0]);
    catch
        continue
    end
    lin = connectLin(lin);
    lin_bw = poly2mask(abs(lin(1,:)),abs(lin(3,:)),1024,1024);
    bw(:,:,end+1)=lin_bw;
end
[node1,elem1,face1]=vol2mesh(bw>0.05,1:size(bw,1),1:size(bw,2),...
    1:size(bw,3),2,2,1,'cgalmesh');
volL=sum(elemvolume(node1,elem1));
fv_3.faces=f4;fv_3.vertices=v4;
bw=[];
for i=min([A(2) C(2)]):max([A(2) C(2)])
    try
        lin=intersectPlaneSurf(fv_3,[0,i,0],[0,1,0]);
    catch
        continue
    end
    lin = connectLin(lin);
    lin_bw = poly2mask(abs(lin(1,:)),abs(lin(3,:)),1024,1024);
    
    bw(:,:,end+1)=lin_bw;
end
[node2,elem2,face2]=vol2mesh(bw>0.05,1:size(bw,1),1:size(bw,2),...
    1:size(bw,3),2,2,1,'cgalmesh');
volR=sum(elemvolume(node2,elem2));