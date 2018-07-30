%Superposition

%n_nodes = 20;

total_response = zeros(k+1,n_nodes);
for i=1:n_nodes
    
   total_response = total_response + Responses(:,:,i);
    
end