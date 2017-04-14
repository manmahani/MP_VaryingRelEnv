clear; close all; clc;
psevals = csvread('PSEs.csv');
psevals = reshape(psevals,5,19,2);

slpvals = csvread('Slopes.csv');
slpvals = reshape(slpvals,5,19,2);

conf = csvread('Confs.csv');
conf = reshape(conf,19,5,2);


%% Exp A, visual-auditory
%repeated ANOVA measurment V-A
t = table(psevals(1,:,1)',psevals(1,:,2)', psevals(2,:,1)',psevals(2,:,2)','VariableNames',{'Y1','Y2','Y3','Y4'}); 
within = table({'H';'H';'L';'L'},{'B';'E';'B';'E'},'VariableNames',{'Rel','Ler'});
rm = fitrm(t,'Y1-Y4~1','WithinDesign',within); % Here the code breaks.
[ranovatbl ,a,c,d] = ranova(rm,'WithinModel','Rel*Ler')

[h,p,s,t] = ttest(psevals(1,:,1)',psevals(1,:,2)')
[h,p,s,t] = ttest(psevals(2,:,1)',psevals(2,:,2)')

%repeated ANOVA measurment V-A Slopes
t = table(slpvals(1,:,1)',slpvals(1,:,2)', slpvals(2,:,1)',slpvals(2,:,2)','VariableNames',{'Y1','Y2','Y3','Y4'}); 
within = table({'H';'H';'L';'L'},{'B';'E';'B';'E'},'VariableNames',{'Rel','Ler'});
rm = fitrm(t,'Y1-Y4~1','WithinDesign',within); % Here the code breaks.
ranovatbl = ranova(rm,'WithinModel','Rel*Ler')

%repeated anova on confidence
%repeated ANOVA measurment V-A
t = table(conf(:,1,1),conf(:,1,2), conf(:,2,1),conf(:,2,2),'VariableNames',{'Y1','Y2','Y3','Y4'}); 
within = table({'H';'H';'L';'L'},{'B';'E';'B';'E'},'VariableNames',{'Rel','Ler'});
rm = fitrm(t,'Y1-Y4~1','WithinDesign',within); % Here the code breaks.
ranovatbl = ranova(rm,'WithinModel','Rel*Ler')



%% Exp B, visual-auditory-tactile
%repeated ANOVA measurment V-T-A
t2 = table(psevals(3,:,1)',psevals(3,:,2)', psevals(4,:,1)',psevals(4,:,2)',psevals(5,:,1)',psevals(5,:,2)','VariableNames',{'Y1','Y2','Y3','Y4','Y5','Y6'}); 
within2 = table({'B';'E';'B';'E';'B';'E'},{'T';'T';'V';'V';'A';'A'},'VariableNames',{'Ler','Rel'});
rm2 = fitrm(t2,'Y1-Y6~1','WithinDesign',within2); % Here the code breaks.
ranovatbl = ranova(rm2,'WithinModel','Ler*Rel')

%repeated ANOVA measurment V-T-A Slopes
t2 = table(slpvals(3,:,1)',slpvals(3,:,2)', slpvals(4,:,1)',slpvals(4,:,2)',slpvals(5,:,1)',slpvals(5,:,2)','VariableNames',{'Y1','Y2','Y3','Y4','Y5','Y6'}); 
within2 = table({'B';'E';'B';'E';'B';'E'},{'T';'T';'V';'V';'A';'A'},'VariableNames',{'Ler','Rel'});
rm2 = fitrm(t2,'Y1-Y6~1','WithinDesign',within2); % Here the code breaks.
ranovatbl = ranova(rm2,'WithinModel','Ler*Rel')
multcompare(rm2,'Rel')


%repeated ANOVA measurment V-A-T coonfidences
t2 = table(conf(:,3,1),conf(:,3,2), conf(:,4,1),conf(:,4,2),conf(:,5,1),conf(:,5,2),'VariableNames',{'Y1','Y2','Y3','Y4','Y5','Y6'}); 
within2 = table({'T';'T';'V';'V';'A';'A'},{'B';'E';'B';'E';'B';'E'},'VariableNames',{'Rel','Ler'});
rm2 = fitrm(t2,'Y1-Y6~1','WithinDesign',within2); % Here the code breaks.
ranovatbl = ranova(rm2,'WithinModel','Rel*Ler')


%repeated ANOVA measurment V-T
t2 = table(psevals(3,:,1)',psevals(3,:,2)', psevals(4,:,1)',psevals(4,:,2)','VariableNames',{'Y1','Y2','Y3','Y4'}); 
within2 = table({'T';'T';'V';'V'},{'B';'E';'B';'E'},'VariableNames',{'Rel','Ler'});
rm2 = fitrm(t2,'Y1-Y4~1','WithinDesign',within2); % Here the code breaks.
ranovatbl = ranova(rm2,'WithinModel','Rel*Ler')


%repeated ANOVA measurment V-T
t2 = table(conf(:,3,1),conf(:,3,2), conf(:,4,1),conf(:,4,2),'VariableNames',{'Y1','Y2','Y3','Y4'}); 
within2 = table({'T';'T';'V';'V'},{'B';'E';'B';'E'},'VariableNames',{'Rel','Ler'});
rm2 = fitrm(t2,'Y1-Y4~1','WithinDesign',within2); % Here the code breaks.
ranovatbl = ranova(rm2,'WithinModel','Rel*Ler')

