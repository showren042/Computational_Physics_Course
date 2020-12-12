n = [10, 20, 50, 100, 200, 500, 1000, 2000];


log_n = log(n);
t_matlab = [0.0716, 0.0045, 0.0540, 0.2433, 1.5601, 81.5711, 864.3700, 4672.8];
t_python = [0.00499, 0.01097, 0.04588, 0.17054, 1.10305, 61.7595, 610.325, 5800.57];

% Command prompt shows "Segmentation Fault(Core Dumped) for n= 500,1000 and
% 2000. Therefore t_cpp couldn't be captured completely


%t_cpp = [0.002, 0.038, 0.599, 127.254];

plot(log_n,log_n,'r','LineWidth',2); hold on
plot(log(n),log(t_matlab),'b','LineWidth',2);
plot(log(n),log(t_python),'c','LineWidth',2);
%plot(log(n),log(t_cpp),'k','LineWidth',2);
xlabel('n');
ylabel('t(n)');
legend('predicted','matlab','python','Location','best');
