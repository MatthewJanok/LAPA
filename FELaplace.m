clc
clear


BCL = 1;
BCR = 0;
%BCU = na;
%BCD = na;

MaxIter = 50;
nx = 12;
ny = 12;
del = 1E-3;

V = zeros(nx,ny);
FD = zeros(nx,ny);

for i = 1:nx
    V(i,1) = 1;
    FD(i,1)=1;
    V
end

for i = 1:nx
    V(i,ny) = 1;
    FD(i,ny)=1;
    V
end


for Iter = 1:MaxIter
    [Ex Ey] = gradient(FD);
    figure(1)
    quiver(Ex,Ey)
    %figure(2)
    %surf(FD)
    pause(0.1)
    for i = 2:nx-1
        for j = 2:ny-1
                        
            if i == 1
%                 FD(i,j) = ((V(i+1,j)-2*V(i,j)+V(nx,j))/(del^2)) + ((V(i,j+1)-2*V(i,j)+V(i,j-1))/(del^2))
%                 FD(i,j) = (V(i+1,j)+V(nx,j)+V(i,j+1)+V(i,j-1))/4              
                FD(i,j) = FD(i+1,j)
%                 V(i,j) = V(i+1,j)
                V = FD;
                V
            elseif i == nx
%                 FD(i,j) = ((V(1,j)-2*V(i,j)+V(i-1,j))/(del^2)) + ((V(i,j+1)-2*V(i,j)+V(i,j-1))/(del^2))
%                 FD(i,j) = (V(1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1))/4
                
                FD(i,j) = FD(i-1,j);
                V = FD;
                V
            else     
%                 FD(i,j) = ((V(i+1,j)-2*V(i,j)+V(i-1,j))/(del^2)) + ((V(i,j+1)-2*V(i,j)+V(i,j-1))/(del^2))
                
                FD(i,j) = (V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1))/4
                V = FD;
                V
            end
        end
    end
    Iter
end

V
FD


















