function obj = readObj(fname)
%
% obj = readObj(fname)
%
% This function parses wavefront object data
% It reads the mesh vertices, texture coordinates, normal coordinates
% and face definitions(grouped by number of vertices) in a .obj file
%
%
% INPUT: fname - wavefront object file full path
%
% OUTPUT: obj.v - mesh vertices
%       : obj.vt - texture coordinates
%       : obj.vn - normal coordinates
%       : obj.f - face definition assuming faces are made of of 3 vertices
%
% Bernard Abayowa, Tec^Edge
% 11/8/07

% set up field types
v = []; vt = []; vn = []; f.v = []; f.vt = []; f.vn = [];
vnum = 1;
vtnum = 1;
vnnum = 1;
f_v_num = 1;
f_vt_num = 1;
f_vn_num = 1;
fid = fopen(fname);

% parse .obj file
while ~feof(fid)
    tline = fgetl(fid);
    l = length(tline);
    %     if ~ischar(tline),   break,   end  % exit at end of file
    ln = sscanf(tline,'%s',1); % line type
    %disp(ln)
    switch ln
        case 'v'   % mesh vertexs
            v(:,vnum)=sscanf(tline(2:l),'%f')';
            vnum = vnum+1;
        case 'vt'  % texture coordinate
            vt(:,vtnum) =sscanf(tline(3:l),'%f')';
            vtnum = vtnum+1;
        case 'vn'  % normal coordinate
            vn(:,vnnum) = sscanf(tline(3:l),'%f')';
            vnnum = vnnum+1;
        case 'f'   % face definition
            fv = []; fvt = []; fvn = [];
            str = textscan(tline(2:l),'%s');
            str = str{1};
            
            nf = length(strfind(str{1},'/')); % number of fields with this face vertices
            fvnum = 1;
            fvtnum = 1;
            fvnnum =1;
            
            %            [tok str] = strtok(str,'//');     % vertex only
            %             for k = 1:length(tok) fv = [fv str2num(tok{k})]; end
            %
            %             if (nf > 0)
            %             [tok str] = strtok(str,'//');   % add texture coordinates
            %                 for k = 1:length(tok) fvt = [fvt str2num(tok{k})]; end
            %             end
            %             if (nf > 1)
            %             [tok str] = strtok(str,'//');   % add normal coordinates
            %                 for k = 1:length(tok) fvn = [fvn str2num(tok{k})]; end
            %             end
            
            %             tok = split(str,'/');
            %             tok_size = size(tok);
            %             for k=1:tok_size(1)
            %                 fv = [fv tok(k,1)];
            %                 if (nf>0)
            %                     fvt = [fvt tok(k,2)];
            %                 end
            %                 if (nf>1)
            %                     fvn = [fvn tok(k,3)];
            %                 end
            %             end
            %
            
            if (nf==0)
                for i=1:length(str)
                    fv(:,fvnum) = sscanf(str{i},'%f');
                    fvnum = fvnum+1;
                end
            elseif nf==1
                for i=1:length(str)
                    data = sscanf(str{i},'%f/%f');
                    fv(:,fvnum) = data(1);
                    fvnum = fvnum+1;
                    fvt(:,fvtnum) =data(2);
                    fvtnum = fvynum+1;
                end
            elseif nf==2
                for i=1:length(str)
                    data = sscanf(str{i},'%f/%f/%f');
                    %                     data_size = size(data);
                    fv(:,fvnum) = data(1);
                    fvnum = fvnum+1;
                    fvt(:,fvtnum) =data(2);
                    fvtnum = fvtnum+1;
                    fvn(:,fvnnum) = data(3);
                    fvnnum = fvnnum+1;
                end
            end
            
            f.v(:,f_v_num) =fv;f_v_num=f_v_num+1;
            f.vt(:,f_vt_num) = fvt;f_vt_num = f_vt_num+1;
            f.vn(:,f_vn_num) = fvn;f_vn_num = f_vn_num+1;
    end
end
fclose(fid);

% set up matlab object
obj.v = v'; obj.vt = vt'; obj.vn = vn';
obj.f.v = f.v';obj.f.vt=f.vt';obj.f.vn=f.vn';

