% 1st
figure(1);
r=1:0.1:10;
n=randn([1 100]); %mu=0 sigma=1
g=randg(1,[1 100]); % gama=1
lamda=1.5;
e=lamda*exp(-lamda*r);

subplot(221);
plot(r);
title('Uniform distribution');
subplot(222);
plot(n);
title('Normal distribution');
subplot(223);
plot(g);
title('Gamma distribution');
subplot(224);
plot(e);
title('Exponential distribution');

% 2nd
figure(2);
x2=[-2,-1,0,1,2]; %mu = 1 sigma=5
cdf_normal = cdf('Normal',x2,1,5);
plot(cdf_normal);
title('CDF');

% 3rd
figure(3);
x3=[-3,-2,-1,0,1,2,3];
normal_ob = makedist("Normal","mu",0,"sigma",1);
plot(cdf(normal_ob,x3));
title('Normal cdf using object');

% 4th
figure(4);
x4=[0,1,2,3,4];
poission_ob = makedist("Poisson",2);
plot(cdf(poission_ob,x4));
title('poission cdf uding object');

% 5th
figure(5);
gamma1=makedist('Gamma');
gamma2=makedist('Gamma','a',1,'b',2);
gamma3=makedist('Gamma','a',2,'b',1);
hold on
a= cdf(gamma1,r);
b= cdf(gamma2,r);
c= cdf(gamma3,r);
plot(a); plot(b); plot(c);
hold off
legend('Dis..1', 'Dis..2','Dis..3');


% 6th
figure(6)
lamda = 0.2;

x6 = 0:0.2:100;
pdfvalues1 = zeros(size(x6));

for i = 1:length(x6)
    pdfvalues1(i) = lamda * exp(-lamda * x6(i));
end

plot(x6, pdfvalues1);
title('PDF for x');

% Finding probability for 0 < x < 1 using the concept of area under the curve
x_min = 0;
x_max = 5;
probability = integral(@(x) lamda * exp(-lamda * x), x_min, x_max);
fprintf('Probability for x_min < x < x_max: %f\n', probability);
