function Result_Avg = dataImport(workbookFile,sheetName,endRow)
%% Input handling
    startRow = 2;

    workbookFile = ['Data\' workbookFile];
%% Import the data
[~, ~, raw] = xlsread(workbookFile, sheetName, sprintf('A%d:M%d',startRow(1),endRow(1)));
for block=2:length(startRow)
    [~, ~, tmpRawBlock] = xlsread(workbookFile, sheetName, sprintf('A%d:M%d',startRow(block),endRow(block)));
    raw = [raw;tmpRawBlock]; %#ok<AGROW>
end
stringVectors = string(raw(:,[1,2]));
stringVectors(ismissing(stringVectors)) = '';
raw = raw(:,[3,4,5,6,7,8,9,10,11,12,13]);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
I = cellfun(@(x) ischar(x), raw);
raw(I) = {NaN};
data = reshape([raw{:}],size(raw));

%% Create table
tableout = table;

%% Allocate imported array to column variable names
tableout.Team = stringVectors(:,1);
tableout.Span = stringVectors(:,2);
tableout.Mat = data(:,1);
tableout.Won = data(:,2);
tableout.Lost = data(:,3);
tableout.Tied = data(:,4);
tableout.NR = data(:,5);
tableout.WL = data(:,6);
tableout.Ave = data(:,7);
tableout.RPO = data(:,8);
tableout.Inns = data(:,9);
tableout.HS = data(:,10);
tableout.LS = data(:,11);

%%
WC_Teams = ["South Africa" "Sri Lanka" "New Zealand" "Bangladesh" "Afghanistan" "India" "England" "Pakistan" "West Indies" "Australia"]';
tempTable = tableout;
row = [];
for i = 1:length(tempTable.Team)
    me_index = find(contains(WC_Teams,tempTable.Team(i)),1);
    if isempty(me_index)
        %if me index is empty we will skip the iteration to save the
        continue;
        %to continues after skiping 
    else
        row(me_index) = i;
    end
end
for i = 1:10
     if (row(i) == 0)
         newRow(1,1).Team = WC_Teams(i);
         newRow(1,1).Span = '';
         newRow(1,1).Mat = 0;
         newRow(1,1).Won = 0;
         newRow(1,1).Lost = 0;
         newRow(1,1).Tied = 0;
         newRow(1,1).NR = 0;
         newRow(1,1).WL = 0;
         newRow(1,1).Ave = 0;
         newRow(1,1).RPO = 0;
         newRow(1,1).Inns = 0;
         newRow(1,1).HS = 0;
         newRow(1,1).LS = 0;
         if (i == 1)
             tableout = struct2table(newRow,'AsArray',true);
         else
             tableout = [tableout; struct2table(newRow,'AsArray',true);];
         end
     elseif i == 1
         tableout = tempTable(row(i),:);
     else
         tableout = [tableout; tempTable(row(i),:)];
     end
end
WinPer = tableout.Won ./(tableout.Mat-tableout.NR);
LossPer = tableout.Lost ./(tableout.Mat-tableout.NR);
TiePer = tableout.Tied ./(tableout.Mat-tableout.NR);

Result_Avg = [WinPer LossPer TiePer];

indexNaN = find(isnan(WinPer));
if ~isempty(indexNaN)
    for i = 1:length(indexNaN)
        Result_Avg(indexNan(i),:) = [0.4 0.4 0.2];
    end
end
%%
indexZero = find(WinPer == 0);
if ~isempty(indexZero)
    for i = 1:length(indexZero)
        Result_Avg(indexZero(i),:) = [0.01 0.99 0];
    end
end

indexOne = find(WinPer == 1);
if ~isempty(indexOne)
    for i = 1:length(indexOne)
        Result_Avg(indexOne(i),:) = [0.99 0.01 0];
    end
end

        
        
