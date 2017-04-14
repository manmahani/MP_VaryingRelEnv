close all

x = 1:0.1:70;

sigma11 = 4.5;
sigma21 = 2.5;
mu11 = 20;
mu21 = 50;
w11 = (1./(sigma11*sigma11))./((1./(sigma11*sigma11))+(1./(sigma21*sigma21)));
w21 = (1./(sigma21*sigma21))./((1./(sigma11*sigma11))+(1./(sigma21*sigma21)));
   
mu31 = mu11*w11+mu21*w21;
w31 = ((1./(sigma11*sigma11))+(1./(sigma21*sigma21)));
sigma31 = sqrt(1./w31);

PSE(1,1)=mu31;
pd11 = makedist('Normal',mu11,sigma11);
pd21 = makedist('Normal',mu21,sigma21);
pd31 =makedist('Normal',mu31,sigma31);
y11 = pdf(pd11,x);
y21 = pdf(pd21,x);
y31 = pdf(pd31,x);
figure;
plot(x,y11,'LineWidth',3,'LineStyle','-.');
hold on;
plot(x,y21,'LineWidth',3,'LineStyle','--');
% plot(x,y31,'LineWidth',1);
plot(x,y31,'Color',[0.1 ,0.5 ,0.1],'LineWidth',3,'LineStyle',':');
% legend ('Modality A estimation', 'Modality B estimation','Integrated AB estimation')
axis([0 70 0 0.35])
%%

sigma12 = 4.5;
sigma22 = 2.5;
mu12 = 20;
mu22 = 50;
w12 = (1./(sigma12*sigma12))./((1./(sigma12*sigma12))+(1./(sigma22*sigma22)));
w22 = (1./(sigma22*sigma22))./((1./(sigma12*sigma12))+(1./(sigma22*sigma22)));
 
%         mu32 = mu12*w12+mu22*w22;
mu32 = mu22;
        w32 = ((1./(sigma12*sigma12))+(1./(sigma22*sigma22)));
%         sigma32 = sqrt(1./w32);
sigma32 = sigma22;
PSE(1,2) = mu32;
pd12 = makedist('Normal',mu12,sigma12);
pd22 = makedist('Normal',mu22,sigma22);
pd32 =makedist('Normal',mu32,sigma32);
y12 = pdf(pd12,x);
y22 = pdf(pd22,x);
y32 = pdf(pd32,x);
ww = w22-w21
figure;
plot(x,y12,'LineWidth',3,'LineStyle','-.');
hold on;
plot(x,y22,'LineWidth',3,'LineStyle','--');
% plot(x,y32,'LineWidth',1);
plot(x,y32,'Color',[0.1 ,0.5 ,0.1],'LineWidth',3,'LineStyle',':');
axis([0 70 0 0.35])
%%

x = 1:0.1:70;

sigma11 = 1.4;
sigma21 = 2.5;
mu11 = 20;
mu21 = 50;
w11 = (1./(sigma11*sigma11))./((1./(sigma11*sigma11))+(1./(sigma21*sigma21)));
w21 = (1./(sigma21*sigma21))./((1./(sigma11*sigma11))+(1./(sigma21*sigma21)));
   
mu31 = mu11*w11+mu21*w21;
w31 = ((1./(sigma11*sigma11))+(1./(sigma21*sigma21)));
sigma31 = sqrt(1./w31);
PSE(2,1) = mu31;
pd11 = makedist('Normal',mu11,sigma11);
pd21 = makedist('Normal',mu21,sigma21);
pd31 =makedist('Normal',mu31,sigma31);
y11 = pdf(pd11,x);
y21 = pdf(pd21,x);
y31 = pdf(pd31,x);
figure;
plot(x,y11,'LineWidth',3,'LineStyle','-.');
hold on;
plot(x,y21,'LineWidth',3,'LineStyle','--');
% plot(x,y31,'Color',[0.1 ,0.5 ,0.1],'LineWidth',3,'LineStyle',':');
plot(x,y31,'LineWidth',1);
% legend ('Modality A estimation', 'Modality B estimation','Integrated AB estimation')
axis([0 70 0 0.35])
%%

sigma12 = 1.4;
sigma22 =2.5;
mu12 = 20;
mu22 = 50;
w12 = (1./(sigma12*sigma12))./((1./(sigma12*sigma12))+(1./(sigma22*sigma22)));
w22 = (1./(sigma22*sigma22))./((1./(sigma12*sigma12))+(1./(sigma22*sigma22)));
 
%         mu32 = mu12*w12+mu22*w22;
mu32 = mu12;
        w32 = ((1./(sigma12*sigma12))+(1./(sigma22*sigma22)));
%         sigma32 = sqrt(1./w32);
sigma32 = sigma12;
PSE(2,2) = mu32;
pd12 = makedist('Normal',mu12,sigma12);
pd22 = makedist('Normal',mu22,sigma22);
pd32 =makedist('Normal',mu32,sigma32);
y12 = pdf(pd12,x);
y22 = pdf(pd22,x);
y32 = pdf(pd32,x);
ww = w22-w21
figure;
plot(x,y12,'LineWidth',3,'LineStyle','-.');
hold on;
plot(x,y22,'LineWidth',3,'LineStyle','--');
plot(x,y32,'LineWidth',1);
% plot(x,y32,'Color',[0.1 ,0.5 ,0.1],'LineWidth',3,'LineStyle',':');
axis([0 70 0 0.35])
%%
figure
plot(PSE')



