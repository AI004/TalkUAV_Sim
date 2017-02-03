%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TalkUAV_Sim  V 0.01
%
% https://zhuanlan.zhihu.com/talkuav
%
% 0.01�汾����ƽ���ؼ����µĻ������ж���ѧ������ת��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

% ������ʼ��
Pre_init;

for i=1:1:Sim.n
    % ����ѧ��������
    Update_dynamics;
    % ��¼����
    Update_record;
    % ��ʾ������Ϣ
    if(mod(i,1/Sim.DT) == 0)
        clc;
        str = ['Time = ',num2str(i*Sim.DT)];
        disp(str);
    end
end
% ���Ʋ�����ʷ����
Post_plot;