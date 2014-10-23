function [gift_graph] = compute_matchings(gift_graph)
n = gift_graph.n;
gift_graph.graph = gift_graph.graph(gift_graph.key,:);
gift_graph.graph = gift_graph.graph(:,gift_graph.key); 

[makers, targets] = meshgrid(1:n,1:n);

A = zeros(3*n,n^2);
flatten = @(x) reshape(x,[],1);
square = @(x) reshape(x,n,n);
for i = 1:n
  A(i,:) = flatten(makers == i & targets ~= i);
  A(i+n,:) = flatten(targets == i & makers ~= i);
  A(i+2*n,:) = flatten(makers == i & targets == i);
end

b = [ones(2*n,1);zeros(n,1)];
c = flatten(gift_graph.graph)'-rand(1,n^2)*0.01;
%tiny bit of noise is added to c to ensure there are no ties.


assignment = linprog(-c,[],[],A,b,zeros(1,21^2));
assignment = square(assignment) > 0.75;
gift_graph.assignment = assignment;

    