clc;clear;close all;
%Definimos la nube
cloud=readmatrix("PointCloud.txt",Delimiter=[" "]);
cloud=cloud(:,2:end);
%Definimos la malla triangular
T=readmatrix("Tmesh.txt",Delimiter=[" ","/"]);
T=[T(:,2) T(:,4) T(:,6)];
%ploteamos la nube
figure(1)
pcshow(cloud(:,1:3))
%Obtenemos la esfera
sphereCloud=cloud(:,1:3)./vecnorm(cloud(:,1:3),2,2);
%mostramos la esfera
figure(2)
pcshow(sphereCloud)
%guardamos en csv file
writematrix([sphereCloud cloud(:,4:6)],'sphere.csv')
%hacemos el mesh
figure(3)
trimesh(T,sphereCloud(:,1),sphereCloud(:,2),sphereCloud(:,3))
%% Plot with time
figure (4)
title("sphere")
pbaspect([1 1 1])
view(135,45)
set(gcf,'WindowState','maximized')
pause(0.5)
hold on
step=24;
for i=step:step:length(cloud)
    rango=(i-step)+1:i;
    scatter3(sphereCloud(rango,1),sphereCloud(rango,2),sphereCloud(rango,3),"filled")
    xlim([-1 1])
    ylim([-1 1])
    zlim([-1 1])
    pause(0.01)
end
hold off
grid