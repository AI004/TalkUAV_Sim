%%%%%% ��ͼ

% ��ͼ��������ϵ���ٶ�
figure;
subplot(3,1,1);plot(Sim.Time,Body_Array.p);grid on;title('��������ϵX����ٶ�');
subplot(3,1,2);plot(Sim.Time,Body_Array.q);grid on;title('��������ϵY����ٶ�');
subplot(3,1,3);plot(Sim.Time,Body_Array.r);grid on;title('��������ϵZ����ٶ�');
% ��ͼ��������ϵ�ٶ�
figure;
subplot(3,1,1);plot(Sim.Time,Body_Array.u);grid on;title('��������ϵX���ٶ�');
subplot(3,1,2);plot(Sim.Time,Body_Array.v);grid on;title('��������ϵY���ٶ�');
subplot(3,1,3);plot(Sim.Time,Body_Array.w);grid on;title('��������ϵZ���ٶ�');
% ��ͼ��������ϵ�켣
figure;plot3(Nav_Array.x,Nav_Array.y,Nav_Array.z);grid on;title('��������ϵ�µĹ켣');set(gca,'ZDir','Reverse')
% ��ͼŷ����
figure;
subplot(3,1,1);plot(Sim.Time,Nav_Array.Phi);grid on;title('��ת��');
subplot(3,1,2);plot(Sim.Time,Nav_Array.Theta);grid on;title('������');
subplot(3,1,3);plot(Sim.Time,Nav_Array.Psi);grid on;title('ƫ����');
% ��ͼ��������ϵ�ٶ�
figure;
subplot(3,1,1);plot(Sim.Time,Nav_Array.Vx);grid on;title('��������ϵX���ٶ�');
subplot(3,1,2);plot(Sim.Time,Nav_Array.Vy);grid on;title('��������ϵY���ٶ�');
subplot(3,1,3);plot(Sim.Time,Nav_Array.Vz);grid on;title('��������ϵZ���ٶ�');