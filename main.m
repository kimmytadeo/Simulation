clear all; close all; clc

N=3;
M=224;
L=10000;

%% prepare S: same for all groups
load 9AbundanceMaps
map1= sum(x(:,:,1:3),3);
map2= sum(x(:,:,4:6),3);
map3= sum(x(:,:,7:9),3);

subplot(2,3,1);
imshow(map1);title('map 1');

subplot(2,3,2);
imshow(map2);title('map 2');

subplot(2,3,3);
imshow(map3);title('map 3');

%% prepare A: different for all groups
load KK_simulation_Library_21endmembers_20140303;
A= KK_simulation_Library_21endmembers_20140303(:,[4 7 13]); % group 1
% A= KK_simulation_Library_21endmembers_20140303(:,[12 15 9]); % groups 2
% A= KK_simulation_Library_21endmembers_20140303(:,[? ? ?]); % create another 35 lines for groups 2~36
% A= KK_simulation_Library_21endmembers_20140303(:,[? ? ?]); % create another 35 lines for groups 2~36
% A= KK_simulation_Library_21endmembers_20140303(:,[? ? ?]); % create another 35 lines for groups 2~36
% A= KK_simulation_Library_21endmembers_20140303(:,[? ? ?]); % create another 35 lines for groups 2~36
% A= KK_simulation_Library_21endmembers_20140303(:,[? ? ?]); % create another 35 lines for groups 2~36
% A= KK_simulation_Library_21endmembers_20140303(:,[? ? ?]); % create another 35 lines for groups 2~36
% A= KK_simulation_Library_21endmembers_20140303(:,[? ? ?]); % create another 35 lines for groups 2~36
% A= KK_simulation_Library_21endmembers_20140303(:,[? ? ?]); % create another 35 lines for groups 2~36
% A= KK_simulation_Library_21endmembers_20140303(:,[? ? ?]); % create another 35 lines for groups 2~36

subplot(2,3,4);
plot(A(:,1)); title('true signature 1');
axis([1 224 0 1]);

subplot(2,3,5);
plot(A(:,2)); title('true signature 2');
axis([1 224 0 1]);

subplot(2,3,6);
plot(A(:,3)); title('true signature 3');
axis([1 224 0 1]);

%% prepare X=AS
S(1,:)= reshape(map1,1,L);
S(2,:)= reshape(map2,1,L);
S(3,:)= reshape(map3,1,L);
X2D= A*S; % 2D matrix
X3D= reshape(X2D',100,100,M); % 3D matrix (what students will get)



%% what students need to do
X= reshape(X3D,L,M)';

[A_est, S_est, time] = HyperCSI(X,N)

figure;
map1_est= reshape(S_est(1,:),100,100);
subplot(2,3,1);
imshow(map1_est);title('map 1 est');
% xlabel('x561ggGJCG','Fontname', 'Times New Roman','FontSize',12);
map2_est= reshape(S_est(2,:),100,100);
subplot(2,3,2);
imshow(map2_est);title('map 2 est');

map3_est= reshape(S_est(3,:),100,100);
subplot(2,3,3);
imshow(map3_est);title('map 3 est');

subplot(2,3,4);
plot(A_est(:,1)); title('est signature 1');
axis([1 224 0 1]);

subplot(2,3,5);
plot(A_est(:,2)); title('est signature 2');
axis([1 224 0 1]);

subplot(2,3,6);
plot(A_est(:,3)); title('est signature 3');
axis([1 224 0 1]);



