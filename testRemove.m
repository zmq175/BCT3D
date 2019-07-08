flip_1=0;flip_2=0;flip_3=0;flip_4=0;flip_5=0;flip_6=0;flip_7=0;flip_8=0;flip_9=0;
fv.faces = mesh.f.v;
fv.vertices = mesh.v;
normf4=cross(B-A,B-C);
normf4 = normf4/norm(normf4);
lin5 = intersectPlaneSurf(fv,A,normf4);
lin5=fixlin(lin5);
lin_5_start=find(abs(lin5(2,:,:)-A(2))<1e-3);
lin_5_end=find(abs(lin5(2,:,:)-C(2))<1e-3);
se=sort([lin_5_start lin_5_end]);
if [lin_5_start lin_5_end] ~=se
    flip_5=1;
end
lin_5_start=se(1);lin_5_end=se(2);
lin5 = lin5(:,lin_5_start:lin_5_end);
se=sort([lin_1_start lin_1_end]);
if [lin_1_start lin_1_end] ~=se
    flip_1=1;
end
se=sort([lin_2_start lin_2_end]);
if [lin_2_start lin_2_end] ~=se
    flip_2=1;
end
se=sort([lin_3_start lin_3_end]);
if [lin_3_start lin_3_end] ~=se
    flip_3=1;
end
se=sort([lin_4_start lin_4_end]);
if [lin_4_start lin_4_end] ~=se
    flip_4=1;
end
plane=createPlane(p0,p1,p2)
indAbove = find(~isBelowPlane(mesh.v, plane))
[v,f]=removeMeshVertices(mesh.v,mesh.f.v,indAbove);
plane=createPlane(p0,A,sym0)
indAbove = find(~isBelowPlane(v, plane))
[v,f]=removeMeshVertices(v,f,indAbove);
plane=createPlane(p2,C,sym2)
indAbove = find(isBelowPlane(v, plane))
[v,f]=removeMeshVertices(v,f,indAbove);
plane=createPlane(sym0,sym1,sym2)
indAbove = find(isBelowPlane(v, plane))
[v2,f2]=removeMeshVertices(v,f,indAbove);
% subplot(1,3,1);
% drawMesh(v2,f2);hold on
% P=discrete_coons_patch(lin_3,lin_1,lin_2,lin_4,100,100);
% [f,v,c]=surf2patch(surf(P(:,:,1),P(:,:,2),P(:,:,3)),'triangles');
% [v2,f2]=concatenateMeshes(v2,f2,v,f);
% patch('vertices', v2, 'faces', f2,'FaceColor','white')
plot3(A(1),A(2),A(3),'x');
plot3(B(1),B(2),B(3),'x');
plot3(C(1),C(2),C(3),'x');
posA=find(abs(lin2(1,:,:)-A(1))<1e-3);
posp0=find(abs(lin2(1,:,:)-p0(1))<1e-3);
possym0=find(abs(lin2(1,:,:)-sym0(1))<1e-3);
se = sort([posp0 posA]);
if [posp0 posA]~=se
    flip_7=1
end
lin7=lin2(:,se(1):se(2));
se = sort([possym0 posA]);
if [posA possym0]~=se
    flip_6=1
end
lin6=lin2(:,se(1):se(2));
lin_5(:,:,1)=lin5(1,:)';lin_5(:,:,2)=lin5(2,:)';lin_5(:,:,3)=lin5(3,:)';
lin_6(:,:,1)=lin6(1,:)';lin_6(:,:,2)=lin6(2,:)';lin_6(:,:,3)=lin6(3,:)';
lin_7(:,:,1)=lin7(1,:)';lin_7(:,:,2)=lin7(2,:)';lin_7(:,:,3)=lin7(3,:)';
if flip_1
    lin_1=flip(lin_1);
end
if flip_2
    lin_2=flip(lin_2);
end
if flip_3
    lin_3=flip(lin_3);
end
if flip_4
    lin_4=flip(lin_4);
end
if flip_5
    lin_5=flip(lin_5);
end
posC=find(abs(lin3(1,:,:)-C(1))<1e-3);
posp2=find(abs(lin3(1,:,:)-p2(1))<1e-3);
possym2=find(abs(lin3(1,:,:)-sym2(1))<1e-3);
se = sort([possym2 posC]);
if [posC possym2]~=se
    flip_8=1
end
lin8=lin3(:,se(1):se(2));
se = sort([posp2 posC]);
if [posp2 posC]~=se
    flip_9=1
end
lin9=lin3(:,se(1):se(2));
lin_8(:,:,1)=lin8(1,:)';lin_8(:,:,2)=lin8(2,:)';lin_8(:,:,3)=lin8(3,:)';
lin_9(:,:,1)=lin9(1,:)';lin_9(:,:,2)=lin9(2,:)';lin_9(:,:,3)=lin9(3,:)';
if flip_6
    lin_6=flip(lin_6);
end
if flip_7
    lin_7=flip(lin_7);
end
if flip_8
    lin_8=flip(lin_8);
end
if flip_9
    lin_9=flip(lin_9);
end

plane = createPlane(A,B,C);
indAbove= find(isBelowPlane(v2, plane));
indBelow = find(~isBelowPlane(v2, plane));
[v3,f3]= removeMeshVertices(v2,f2,indAbove);
[v4,f4]= removeMeshVertices(v2,f2,indBelow);
P3=discrete_coons_patch(flip(lin_6),lin_4,flip(lin_8),lin_5,10,10)
[f,v,c]=surf2patch(surf(P3(:,:,1),P3(:,:,2),P3(:,:,3)),'triangles');
[v3,f3]=concatenateMeshes(v3,f3,v,f);
patch('vertices', v3, 'faces', f3,'FaceColor','red');hold on

P4=discrete_coons_patch(lin_7,lin_1,lin_9,lin_5,10,10);
[f,v,c]=surf2patch(surf(P4(:,:,1),P4(:,:,2),P4(:,:,3)),'triangles');
[v4,f4]=concatenateMeshes(v4,f4,v,f);
patch('vertices', v4, 'faces', f4,'FaceColor','red');

% subplot(1,3,2);
% drawMesh(v3,f3);
% subplot(1,3,3);
% drawMesh(v4,f4);
% vol1=meshVolume(v2,f2)
vol2=meshVolume(v3,f3)
vol3=meshVolume(v4,f4)
fv_2.faces=f3;fv_2.vertices=v3;
area2=0;
% for i=10:length(lin5)
%     lin=intersectPlaneSurf(fv_2,lin5(:,i),[0,1,0]);
%     lin = cell2mat(lin);
%     lin2D=[lin(1,:);lin(3,:)];
%     area2=area2+polyarea(lin2D(1,:)',lin2D(2,:)');
% end
fv_3.faces=f4;fv_3.vertices=v3;
area3=0;
for i=10:length(lin5)
    lin=intersectPlaneSurf(fv_3,lin5(:,i),[0,1,0]);
    lin = cell2mat(lin);
    lin2D=[lin(1,:);lin(3,:)];
    area3=area3+polyarea(lin2D(1,:)',lin2D(2,:)');
end