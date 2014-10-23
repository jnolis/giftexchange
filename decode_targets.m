function targets = decode_targets(gift_graph)

gift_graph.assignment = gift_graph.assignment(gift_graph.unkey,:);
gift_graph.assignment = gift_graph.assignment(:,gift_graph.unkey);
targets = cell(gift_graph.n,1);
for i = 1:gift_graph.n
    temp_assign = find(gift_graph.assignment(i,:),1,'first');
    targets(i) = gift_graph.name(temp_assign);
end
