%%
load('AdvancedAlgorithmsData');

%% Plot times with GE
for n = 1:10
   
    figure;
    hold on;
    plot(1:100,geTime(n,:));
    plot(1:100,luTime(n,:));
    plot(1:100,svdTime(n,:));
    plot(1:100,qrTime(n,:));
    title([num2str(n*100) ' by ' num2str(n*100) ' Matrix']);
    xlabel('Total Iterations');
    ylabel('Seconds');
    legend('Gaussian Elimination','LU Factorization', 'Singular Value Decomposition', 'QR Factorization','Location','northwest');
    hold off; 
end

%% Plot times without GE

for n = 1:10
   
    figure;
    hold on;
    plot(1:100,luTime(n,:));
    plot(1:100,svdTime(n,:));
    plot(1:100,qrTime(n,:));
    title([num2str(n*100) ' by ' num2str(n*100) ' Matrix']);
    xlabel('Total Iterations');
    ylabel('Seconds');
    legend('LU Factorization', 'Singular Value Decomposition', 'QR Factorization','Location','northwest');
    hold off; 
end

%% Plot times by matrix dimensions for 100 iterations
   
figure;
hold on;
plot(100:100:1000,geTime(:,100));
plot(100:100:1000,luTime(:,100));
plot(100:100:1000,svdTime(:,100));
plot(100:100:1000,qrTime(:,100));
title('Runtime With Different Matrix Dimensions');
xlabel('Matrix Size');
ylabel('Seconds');
legend('Gaussian Elimination','LU Factorization', 'Singular Value Decomposition', 'QR Factorization','Location','northwest');
hold off; 

figure;
hold on;
plot(100:100:1000,luTime(:,100));
plot(100:100:1000,svdTime(:,100));
plot(100:100:1000,qrTime(:,100));
title('Runtime With Different Matrix Dimensions');
xlabel('Matrix Size');
ylabel('Seconds');
legend('LU Factorization', 'Singular Value Decomposition', 'QR Factorization','Location','northwest');
hold off; 