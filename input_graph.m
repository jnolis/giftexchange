function gift_graph = input_graph(filename)
% as input, takes a file location of an excel file containing the mappings
% for the possible gift targets
% output - a gift graph structure
[~,raw,~] = xlsread(filename);

gift_graph.name = raw(2:end,1);
gift_graph.email = raw(2:end,2);
gift_graph.n = length(gift_graph.name);
gift_graph.graph = NaN(gift_graph.n);
for i = 1:gift_graph.n
    for j = 1:gift_graph.n
        if strcmp(raw(i+1,j+3),'N')
            gift_graph.graph(i,j) = 0;
        elseif strcmp(raw(i+1,j+3),'Y')
            gift_graph.graph(i,j) = 1;
        elseif strcmp(raw(i+1,j+3),'YYY')
            gift_graph.graph(i,j) = 3;
        elseif strcmp(raw(i+1,j+3),'YYYYY')
            gift_graph.graph(i,j) = 10000;
        end
    end
end

gift_graph.graph = gift_graph.graph';
gift_graph.key = randperm(gift_graph.n)';
gift_graph.unkey = zeros(gift_graph.n,1);
for i = 1:gift_graph.n;
    gift_graph.unkey(i) = find(gift_graph.key == i);
end

if any(any(isnan(gift_graph.graph)))
    error('Missing Data');
end