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

Pre_init;

for i=1:1:Sim.n
    Update_dynamics;
    Update_record;
end

Post_plot;