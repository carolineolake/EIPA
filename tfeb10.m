%Caroline Deluce
%101041614
%The structure of this code is based of of Smy's QMCode

tiledlayout(4,4)

nx = 50;
ny = 50;
%ny = 100;

G = sparse(nx*ny);

for i = 1:nx
    for j = 1:ny 
        
        n = j + (i - 1) * ny; 
        
        if ((i == 1 || i == nx) || (j == 1 || j == ny))
            
             G(n,n) = 1;
             
            
        else 
        
            nxm =  j + (i - 2) * ny; % i = (i - 1)
            disp(nxm);
            nxp = j + (i) * ny; % i = (i+1)
            nym = (j - 1) + (i - 1) * ny; % j = (j-1)
            nyp = (j + 1) + (i - 1) * ny; % j = (j+1)
            
            G(n,n) = -4; 
            %G(n,n) = -1;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
            
        end % if statement
          
    end %j loop

end % i loop

nexttile
spy(G);
[E,D] = eigs(G,9,'SM'); %E=eigenvectors D=eigenvalues diag function with extract dig
nexttile
plot(D);

A = zeros(nx,ny);


for z = 1:9
    for i = 1:nx
        for j = 1:ny 
        
            n = j + (i - 1) * ny;
            A(i,j) = E(n, z); 
            

        end
    end
    nexttile
    surf(A); 
    
end
