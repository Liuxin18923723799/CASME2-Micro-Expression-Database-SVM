%%ʹ��SVM��Ϊ����������һ��ѡȡѵ�����Լ�
clear all;close all;clc;
%׼�����ݣ����淶���ݸ�ʽ
load 'CASME2_feature_block55_P4.mat';
load 'CASME2_label.mat';
feature = feature';
N = length(label);  %NΪlabel����
rate = 0;
for i = 1:N
    [train,test] = crossvalind('LeaveMOut',N,1);%��һ��
    %ѵ����
    train_feature = feature(train,:)
    train_label = label(train);
    %���Լ�
    test_feature = feature(test,:)
    test_label = label(test);
    %svmģ��
    model = svmtrain(train_label,train_feature);
    %��֤���
    [predicted_label, accuracy, prob_estimates] = svmpredict(test_label, test_feature, model, 'b');
    rate = rate + accuracy(1);
end

%%����ʶ����
rate = rate/(N*100)