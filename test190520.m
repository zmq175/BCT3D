R=viewmtx(az,el);
meshx=mesh;
meshx.v=zeros(length(mesh.v),4);
for i=1:length(mesh.v)
    vec=[mesh.v(i,:) 1];
    meshx.v(i,:)=(R*vec')';
end
meshx.v=meshx.v(:,1:3,:);
meshx.f.v=mesh.f.v;
meshx.f.vt=mesh.f.vt;
meshx.vt=mesh.vt;
figure;display_obj(meshx, '/Users/zmq175/Downloads/MSc_Project/obj/P003.bmp');