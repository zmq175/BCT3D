function varargout = BCT(varargin)
% BCT MATLAB code for BCT.fig
%      BCT, by itself, creates a new BCT or raises the existing
%      singleton*.
%
%      H = BCT returns the handle to a new BCT or the handle to
%      the existing singleton*.
%
%      BCT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BCT.M with the given input arguments.
%
%      BCT('Property','Value',...) creates a new BCT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BCT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BCT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BCT

% Last Modified by GUIDE v2.5 03-Jun-2019 00:15:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
mesh_obj = '';
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @BCT_OpeningFcn, ...
    'gui_OutputFcn',  @BCT_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before BCT is made visible.
function BCT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BCT (see VARARGIN)

% Choose default command line output for BCT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
setGlobalManual(0);

% UIWAIT makes BCT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BCT_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName,pathName] = uigetfile({'.obj'}, 'File Selector');
if isequal(fileName,0)
    disp('User selected Cancel');
else
    disp(['User selected ', fullfile(pathName,fileName)]);
    pathAll = strcat(pathName,fileName);
    mesh_obj = pathAll;
    setGlobalmesh(readObj(mesh_obj));
    mesh = getGlobalmesh;
    pathDir = dir([pathName '*.png']);
    if isempty(pathDir)
        pathDir = dir([pathName '*.bmp']);
    end
    axes(handles.MeshView);
    cla(handles.MeshView);
    display_obj(mesh,[pathName pathDir(1).name]);
    setGlobalTexture([pathName pathDir(1).name]);
    hold on;
    [az,el] = view;
    set(handles.azSlider,'Value',az);
    set(handles.elSlider,'Value',el);
end


% --- Executes on button press in marker.
function marker_Callback(hObject, eventdata, handles)
% hObject    handle to marker (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of marker
if get(hObject, 'Value')
    datacursormode on
else
    datacursormode off
end


% --- Executes on button press in drawBtn.
function drawBtn_Callback(hObject, eventdata, handles)
% hObject    handle to drawBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data_cursor_obj = datacursormode();
cursor = getCursorInfo(data_cursor_obj);
cursor = flip(cursor);
mesh = getGlobalmesh;
flip_1=0;flip_2=0;flip_3=0;flip_4=0;flip_5=0;flip_6=0;flip_7=0;flip_8=0;flip_9=0;
fv.faces = mesh.f.v;
fv.vertices = mesh.v;
% for i = 1:length(cursors)
%     pos = cursors(i).Position;
%     lin1 = intersectPlaneSurf(fv, pos, [0 0 1]);
%     lin2 = intersectPlaneSurf(fv, pos, [0 1 0]);
%     lin = [lin1 lin2];
%     for m=1:size(lin,2)
%         hold on,plot3(lin{m}(1,:),lin{m}(2,:),lin{m}(3,:),'k','Linewidth',2)
%     end
%     hold off;
% end
A = cursor(1).Position;B=cursor(2).Position;C=cursor(3).Position;
p0= cursor(4).Position;p1 = cursor(5).Position;p2=cursor(6).Position;
hold on;
plot3(A(1),A(2),A(3),'x');
plot3(B(1),B(2),B(3),'x');
plot3(C(1),C(2),C(3),'x');
plot3(p0(1),p0(2),p0(3),'o');
plot3(p1(1),p1(2),p1(3),'o');
plot3(p2(1),p2(2),p2(3),'o');
if(getGlobalManual)
    %     sym0 = get_symmetric_point(p0,A,B,C);
    sym0 = cursor(7).Position;
    plot3(sym0(1),sym0(2),sym0(3),'o');
    %  sym1 = get_symmetric_point(p1,A,B,C);
    sym1 = cursor(8).Position;
    plot3(sym1(1),sym1(2),sym1(3),'o');
    %  sym2 = get_symmetric_point(p2,A,B,C);
    sym2 = cursor(9).Position;
    plot3(sym2(1),sym2(2),sym2(3),'o');
else
    sym0 = get_symmetric_point(p0,A,B,C);
    % sym0 = cursor(7).Position;
    plot3(sym0(1),sym0(2),sym0(3),'o');
    sym1 = get_symmetric_point(p1,A,B,C);
    % sym1 = cursor(8).Position;
    plot3(sym1(1),sym1(2),sym1(3),'o');
    sym2 = get_symmetric_point(p2,A,B,C);
    % sym2 = cursor(9).Position;
    plot3(sym2(1),sym2(2),sym2(3),'o');
end
normf0 = cross(p1-p0,p1-p2);
normf0 = normf0/norm(normf0);
lin1 = intersectPlaneSurf(fv,p0,normf0);
% for m=1:size(lin1,2)
%     hold on,plot3(lin1{m}(1,:),lin1{m}(2,:),lin1{m}(3,:),'k','Linewidth',2)
% end
normf1 = cross(A-p0,A-sym0);
normf1 = normf1/norm(normf1);
lin2 = intersectPlaneSurf(fv,p0,normf1);
% for m=1:size(lin2,2)
%     hold on,plot3(lin2{m}(1,:),lin2{m}(2,:),lin2{m}(3,:),'k','Linewidth',2)
% end
normf2 = cross(C-p2,C-sym2);
lin3 = intersectPlaneSurf(fv,p2,normf2);
% for m=1:size(lin3,2)
%     hold on,plot3(lin3{m}(1,:),lin3{m}(2,:),lin3{m}(3,:),'k','Linewidth',2)
% end
normf3 = cross(sym1-sym0,sym1-sym2);
lin4 = intersectPlaneSurf(fv,sym0,normf3);
% for m=1:size(lin4,2)
%     hold on,plot3(lin4{m}(1,:),lin4{m}(2,:),lin4{m}(3,:),'k','Linewidth',2)
% end
lin1=connectLin(lin1);
lin2=connectLin(lin2);
lin3=connectLin(lin3);
lin4=connectLin(lin4);
lin_1_start=find(abs(lin1(1,:,:)-p0(1))<1e-3);
lin_1_end=find(abs(lin1(1,:,:)-p2(1))<1e-3);
se=sort([lin_1_start lin_1_end]);
if [lin_1_start lin_1_end] ~=se
    flip_1=1;
end
lin_1_start=se(1);lin_1_end=se(2);
lin1 = lin1(:,lin_1_start:lin_1_end);
lin_2_start=find(abs(lin2(1,:,:)-p0(1))<1e-3);
lin_2_end=find(abs(lin2(1,:,:)-sym0(1))<1e-3);
se=sort([lin_2_start lin_2_end]);
if [lin_2_start lin_2_end] ~=se
    flip_2=1;
end
lin_2_start=se(1);lin_2_end=se(2);
lin2 = lin2(:,lin_2_start:lin_2_end);
lin_3_start=find(abs(lin3(1,:,:)-p2(1))<1e-3);
lin_3_end=find(abs(lin3(1,:,:)-sym2(1))<1e-3);
se=sort([lin_3_start lin_3_end]);
if [lin_3_start lin_3_end] ~=se
    flip_3=1;
end
lin_3_start=se(1);lin_3_end=se(2);
lin3 = lin3(:,lin_3_start:lin_3_end);
lin_4_start=find(abs(lin4(1,:,:)-sym0(1))<1e-3);
lin_4_end=find(abs(lin4(1,:,:)-sym2(1))<1e-3);
se=sort([lin_4_start lin_4_end]);
if [lin_4_start lin_4_end] ~=se
    flip_4=1;
end
lin_4_start=se(1);lin_4_end=se(2);
lin4 = lin4(:,lin_4_start:lin_4_end);
plot3(lin1(1,:),lin1(2,:),lin1(3,:),'k','Linewidth',2);
plot3(lin2(1,:),lin2(2,:),lin2(3,:),'k','Linewidth',2);
plot3(lin3(1,:),lin3(2,:),lin3(3,:),'k','Linewidth',2);
plot3(lin4(1,:),lin4(2,:),lin4(3,:),'k','Linewidth',2);
lin_1(:,:,1)=lin1(1,:)';lin_1(:,:,2)=lin1(2,:)';lin_1(:,:,3)=lin1(3,:)';
lin_2(:,:,1)=lin2(1,:)';lin_2(:,:,2)=lin2(2,:)';lin_2(:,:,3)=lin2(3,:)';
lin_3(:,:,1)=lin3(1,:)';lin_3(:,:,2)=lin3(2,:)';lin_3(:,:,3)=lin3(3,:)';
lin_4(:,:,1)=lin4(1,:)';lin_4(:,:,2)=lin4(2,:)';lin_4(:,:,3)=lin4(3,:)';
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
P=discrete_coons_patch(lin_3,lin_1,lin_2,lin_4,10,10);
s=surf(P(:,:,1),P(:,:,2),P(:,:,3)),shading interp;
hold off;hold off;
% remove
normf4=cross(B-A,B-C);
normf4 = normf4/norm(normf4);
lin5 = intersectPlaneSurf(fv,A,normf4);
lin5=cell2mat(lin5);
lin_5_start=find(abs(lin5(2,:,:)-A(2))<1e-3);
lin_5_end=find(abs(lin5(2,:,:)-C(2))<1e-3);
se=sort([lin_5_start lin_5_end]);
if [lin_5_start lin_5_end] ~=se
    flip_5=1;
end
lin_5_start=se(1);lin_5_end=se(2);
lin5 = lin5(:,lin_5_start:lin_5_end);
plane=createPlane(p0,p1,p2);
indAbove = find(~isBelowPlane(mesh.v, plane));
[v,f]=removeMeshVertices(mesh.v,mesh.f.v,indAbove);
plane=createPlane(p0,A,sym0);
indAbove = find(~isBelowPlane(v, plane));
[v,f]=removeMeshVertices(v,f,indAbove);
plane=createPlane(p2,C,sym2);
indAbove = find(isBelowPlane(v, plane));
[v,f]=removeMeshVertices(v,f,indAbove);
plane=createPlane(sym0,sym1,sym2);
indAbove = find(isBelowPlane(v, plane));
[v2,f2]=removeMeshVertices(v,f,indAbove);
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
P3=discrete_coons_patch(flip(lin_6),lin_4,flip(lin_8),lin_5,10,10);
[f,v,c]=surf2patch(surf(P3(:,:,1),P3(:,:,2),P3(:,:,3)),'triangles');
[v3,f3]=concatenateMeshes(v3,f3,v,f);
patch('vertices', v3, 'faces', f3,'FaceColor','red');hold on

P4=discrete_coons_patch(lin_7,lin_1,lin_9,lin_5,10,10);
[f,v,c]=surf2patch(surf(P4(:,:,1),P4(:,:,2),P4(:,:,3)),'triangles');
[v4,f4]=concatenateMeshes(v4,f4,v,f);
patch('vertices', v4, 'faces', f4,'FaceColor','red');

volL=calculateVolume(v3,f3,A,C);
volR=calculateVolume(v4,f4,A,C);
set(handles.leftVolumeTxt,'String', volL);
set(handles.rightVolumeTxt, 'String', volR);


function setGlobalmesh(val)
global mesh
mesh = val

function r=getGlobalmesh
global mesh
r = mesh

function setGlobalManual(val)
global manual
manual = val

function r=getGlobalManual(val)
global manual
r = manual

function setGlobalTexture(val)
global texture
texture = val

function r=getGlobalTexture
global texture
r = texture

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
setGlobalManual(not(getGlobalManual));


% --- Executes on slider movement.
function elSlider_Callback(hObject, eventdata, handles)
% hObject    handle to elSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
el = get(hObject,'Value');
az = get(handles.azSlider,'Value');
view(az,el);

% --- Executes during object creation, after setting all properties.
function elSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to elSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function azSlider_Callback(hObject, eventdata, handles)
% hObject    handle to azSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
az = get(hObject,'Value');
el = get(handles.elSlider,'Value');
view(az,el);


% --- Executes during object creation, after setting all properties.
function azSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to azSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in setPositiveButton.
function setPositiveButton_Callback(hObject, eventdata, handles)
% hObject    handle to setPositiveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
el = get(handles.elSlider,'Value');
az = get(handles.azSlider,'Value');
mesh = getGlobalmesh;
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
setGlobalmesh(meshx);
mesh = getGlobalmesh;
axes(handles.MeshView);
cla(handles.MeshView);
display_obj(mesh,getGlobalTexture);
hold on;
view(0,90);
[az,el] = view;
set(handles.azSlider,'Value',az);
set(handles.elSlider,'Value',el);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = frame2im(getframe);
imwrite(im,'2d.jpg');
