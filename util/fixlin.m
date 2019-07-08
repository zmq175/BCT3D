function new_lin = fixlin(lin)
new_lin = []; lin_arranged = [];
nearest_pos = 0;nearest_distance = Inf;
len=length(lin);
if len==1
    new_lin=cell2mat(lin);
    return
end
for i=1:len
    current_lin_end = lin{i}(:,end);
    current_lin_start = lin{i}(:,1);
    nearest_pos = i;
    if ismember(i,lin_arranged)
        continue
    end
    for j = i+1:len
        if ismember(j,lin_arranged)
            continue
        end
        measured_lin_start = lin{j}(:,1);
        measured_lin_end = lin{j}(:,end);
        start_distance = distancePoints3d(current_lin_end',measured_lin_start');
        end_distance = distancePoints3d(current_lin_end',measured_lin_end');
        if end_distance<start_distance
            lin{j}=fliplr(lin{j});
            start_distance=end_distance;
        end
        if start_distance<nearest_distance
            nearest_distance = start_distance;
            nearest_pos = j;
        end
    end
    if i==1
        new_lin = [new_lin lin{1}];
        lin_arranged = [lin_arranged 1];
    end
    new_lin = [new_lin lin{nearest_pos}];
    lin_arranged = [lin_arranged nearest_pos];
end

    
        