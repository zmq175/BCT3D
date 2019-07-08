function connected_lin = connectLin(lin,enclosed_line)
LENGTH = length(lin);
if(nargin<2)
    enclosed_line = false;
end
% length of input lin cell
nodes = struct('tswitch',true);
for n=1:LENGTH*2
    nodes(n).tswitch = true;
end
output = [];
c = 0; total = 1;
totalpno = findmajorsegment(lin, LENGTH);
sortsegments(lin, LENGTH, 2);
% connected_lin = output;
if(enclosed_line)
    connected_lin = output;
else
    connected_lin = output(:,1:end-1,:);
end
    function totalpno = findmajorsegment(lin, len)
        totalpno = 0;
        j = 0; k = 0;
        for i = 1:len
            if(length(lin{i})>j)
                j = length(lin{i});
                k = i;
            end
            totalpno = totalpno + length(lin{i});
        end
        %	send longest segment nodes into node pool
        nodes(1).point = lin{k}(:,1,:);
        nodes(1).tswitch = false;
        nodes(1).belong = k;
        nodes(2).point = lin{k}(:,length(lin{k}),:);
        nodes(2).tswitch = false;
        nodes(2).belong = k;
        %	send longest segment points into output as initial
        total = 1;
        output = zeros(3,totalpno);
        for i = 1:size(lin{k},2)
            output(:,total,:) = lin{k}(:,i,:);
            total = total + 1;
        end
        %	end other segment nodes into node pool, but they are out of order
        c = 3;
        for i = 1:len
            if(i ~= k)
                try
                    nodes(c).point = lin{i}(:,1,:);
                    nodes(c).belong = i;
                    c = c+1;
                    nodes(c).point = lin{i}(:,size(lin{i},2),:);
                    nodes(c).belong = i;
                    c = c+1;
                catch
                    save debug.mat
                end
            end
        end
    end
    function sortsegments(lin, len, pos)
        %	pos:	current end
        allsorted = true;
        for i=1:c-1
            if(nodes(i).tswitch)
                allsorted = false;
            end
        end
        if(allsorted)
            output = [output output(:,1,:)];
            return;
        end
        k = 1;
        point_dist = Inf;
        for i = 3:c-1
            if(nodes(i).tswitch)
                %	only check nodes that are still active in the node pool
                if(distancePoints3d(nodes(i).point',nodes(pos).point')<point_dist)
                    point_dist = distancePoints3d(nodes(i).point',nodes(pos).point');
                    k = i;
                end
            end
        end
        %	nearest node found, check whether it is start or end, sort this segment into output and close the nodes in the node pool
        next = 0;
        if (nodes(k).point == lin{nodes(k).belong}(:,1,:))
            for i=1:size(lin{nodes(k).belong},2)
                output(:,total,:) = lin{nodes(k).belong}(:,i,:);
                total = total + 1;
            end
            nodes(k).tswitch = false;
            nodes(k+1).tswitch = false;
            next = k + 1;
        elseif (nodes(k).point == lin{nodes(k).belong}(:,size(lin{nodes(k).belong},2),:))
            for i = size(lin{nodes(k).belong},2):-1:1
                output(:,total,:) = lin{nodes(k).belong}(:,i,:);
                total = total + 1;
            end
            nodes(k).tswitch = false;
            nodes(k-1).tswitch = false;
            next = k;
        end
        sortsegments(lin, len, next);
    end
end
