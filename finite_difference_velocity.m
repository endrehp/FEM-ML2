% Finite difference velocity

DT = zeros(k,n_nodes-1);

for time_i=1:k
   for node_j=1:n_nodes-1
       
       if time_i == 1
           DT(time_i, node_j) = 1/(dt)*(D(time_i+1,node_j) - D(time_i,node_j));
       
       elseif time_i == k
           DT(time_i, node_j) = 1/(dt)*(D(time_i,node_j) - D(time_i-1,node_j));
       
       else
           DT(time_i, node_j) = 1/(2*dt)*(D(time_i+1,node_j) - D(time_i-1,node_j)); 
       
       end
   end
end