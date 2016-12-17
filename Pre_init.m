%%%%% ��������ͳ�ʼ���ļ�

%%%%% ����ʱ�䲽��
Sim.DT = 0.01;              % ���沽��
Sim.T = 10;                 % ������ʱ��
Sim.Time = 0:Sim.DT:Sim.T;          % ����ʱ������
Sim.n = length(Sim.Time);   % ��ʱ�������

%%%%% ���������������ʼ��

%%%%% ״̬������ʼ��
% ����Ǧ��������������ϵ��������γ�ȡ�ŷ���ǵ�
Nav.Lat = 0;                % γ��
Nav.Lon = 0;                % ����
Nav.Alt = 0;                % �߶�
Nav.x = 0;                  % X�����꣬��Ϊ��
Nav.y = 0;                  % Y�����꣬��Ϊ��
Nav.z = 0;                  % Z�����꣬����Ϊ��
Nav.Vx = 0;                 % X���ٶȣ���Ϊ��
Nav.Vy = 0;                 % Y���ٶȣ���Ϊ��
Nav.Vz = 0;                 % Z���ٶȣ�����Ϊ��
Nav.V = 0;                  % ���ٶ�
Nav.Vx_dot = 0;             % X����ٶȣ���Ϊ��
Nav.Vy_dot = 0;             % Y����ٶȣ���Ϊ��
Nav.Vz_dot = 0;             % Z����ٶȣ�����Ϊ��
Nav.Phi = 0;                % ��ת��
Nav.Theta = 0;              % ������
Nav.Psi = 0;                % ƫ����
Nav.Phi_dot = 0;            % ��ת�Ǳ仯��
Nav.Theta_dot = 0;          % �����Ǳ仯��
Nav.Psi_dot = 0;            % ƫ���Ǳ仯��
% ��Ԫ��
Nav.Q_0 = cos(Nav.Phi/2)*cos(Nav.Theta/2)*cos(Nav.Psi/2) ...
        + sin(Nav.Phi/2)*sin(Nav.Theta/2)*sin(Nav.Psi/2);                
Nav.Q_1 = sin(Nav.Phi/2)*cos(Nav.Theta/2)*cos(Nav.Psi/2) ...
        - cos(Nav.Phi/2)*sin(Nav.Theta/2)*sin(Nav.Psi/2);
Nav.Q_2 = cos(Nav.Phi/2)*sin(Nav.Theta/2)*cos(Nav.Psi/2) ...
        + sin(Nav.Phi/2)*cos(Nav.Theta/2)*sin(Nav.Psi/2);
Nav.Q_3 = cos(Nav.Phi/2)*cos(Nav.Theta/2)*sin(Nav.Psi/2) ...
        - sin(Nav.Phi/2)*sin(Nav.Theta/2)*cos(Nav.Psi/2);
Nav.Q_0_dot = 0;            % ��Ԫ��΢�� 
Nav.Q_1_dot = 0;
Nav.Q_2_dot = 0;
Nav.Q_3_dot = 0;

Nav_last = Nav;             % ��һ�����ڵĵ�������ϵ״̬

%  ��¼������������
Nav_Array.Lat = zeros(Sim.n,1);               
Nav_Array.Lon = zeros(Sim.n,1);               
Nav_Array.Alt = zeros(Sim.n,1);               
Nav_Array.x = zeros(Sim.n,1);                 
Nav_Array.y = zeros(Sim.n,1);                
Nav_Array.z = zeros(Sim.n,1);              
Nav_Array.Vx = zeros(Sim.n,1);             
Nav_Array.Vy = zeros(Sim.n,1);               
Nav_Array.Vz = zeros(Sim.n,1);            
Nav_Array.V = zeros(Sim.n,1);               
Nav_Array.Vx_dot = zeros(Sim.n,1);          
Nav_Array.Vy_dot = zeros(Sim.n,1);          
Nav_Array.Vz_dot = zeros(Sim.n,1);           
Nav_Array.Phi = zeros(Sim.n,1);             
Nav_Array.Theta = zeros(Sim.n,1);         
Nav_Array.Psi = zeros(Sim.n,1);             
Nav_Array.Phi_dot = zeros(Sim.n,1);            
Nav_Array.Theta_dot = zeros(Sim.n,1);        
Nav_Array.Psi_dot = zeros(Sim.n,1);          
Nav_Array.Q_0 = zeros(Sim.n,1);              
Nav_Array.Q_1 = zeros(Sim.n,1);
Nav_Array.Q_2 = zeros(Sim.n,1);
Nav_Array.Q_3 = zeros(Sim.n,1);
Nav_Array.Q_0_dot = zeros(Sim.n,1);        
Nav_Array.Q_1_dot = zeros(Sim.n,1);
Nav_Array.Q_2_dot = zeros(Sim.n,1);
Nav_Array.Q_3_dot = zeros(Sim.n,1);



%  ��������ϵ״̬����
Body.p = 0;                 % ��X�ᣨ��ת�����ٶ�
Body.q = 0;                 % ��Y�ᣨ���������ٶ�
Body.r = 0;                 % ��Z�ᣨƫ�������ٶ�
Body.u = 0;                 % X���ٶ�
Body.v = 0;                 % Y���ٶ�
Body.w = 0;                 % Z���ٶ�
Body.p_dot = 0;             % ��X�ᣨ��ת���Ǽ��ٶ�
Body.q_dot = 0;             % ��Y�ᣨ�������Ǽ��ٶ�
Body.r_dot = 0;             % ��Z�ᣨƫ�����Ǽ��ٶ�
Body.u_dot = 0;             % X����ٶ�
Body.v_dot = 0;             % Y����ٶ�
Body.w_dot = 0;             % Z����ٶ�

Body_last = Body;           % ��һ�����ڵĻ�������ϵ״̬

%  ��¼�������ò���
Body_Array.p = zeros(Sim.n,1);       
Body_Array.q = zeros(Sim.n,1);            
Body_Array.r = zeros(Sim.n,1);
Body_Array.u = zeros(Sim.n,1);
Body_Array.v = zeros(Sim.n,1);
Body_Array.w = zeros(Sim.n,1);
Body_Array.p_dot = zeros(Sim.n,1);
Body_Array.q_dot = zeros(Sim.n,1);
Body_Array.r_dot = zeros(Sim.n,1);
Body_Array.u_dot = zeros(Sim.n,1);
Body_Array.v_dot = zeros(Sim.n,1);
Body_Array.w_dot = zeros(Sim.n,1);



%%%%% �ⲿ�������س�ʼ��
Force.Fx = 0;               % X������
Force.Fy = 0;               % Y������
Force.Fz = 0;               % Z������
Force.Mx = 0;               % X������
Force.My = 0;               % Y������
Force.Mz = 0;               % Z������

Force_last = Force;         % ��һ�����ڵ���������

Force_Array.Fx = zeros(Sim.n,1);
Force_Array.Fy = zeros(Sim.n,1);
Force_Array.Fz = zeros(Sim.n,1);
Force_Array.Mx = zeros(Sim.n,1);
Force_Array.My = zeros(Sim.n,1);
Force_Array.Mz = zeros(Sim.n,1);

%%%%% ����任�����ʼ��
%  ��������ϵת����������ϵ
Mat.C_g2b(1,1) = cos(Nav.Theta)*cos(Nav.Psi);
Mat.C_g2b(1,2) = cos(Nav.Theta)*sin(Nav.Psi);
Mat.C_g2b(1,3) = -sin(Nav.Theta);
Mat.C_g2b(2,1) = sin(Nav.Phi)*sin(Nav.Theta)*cos(Nav.Psi) - cos(Nav.Phi)*sin(Nav.Psi);
Mat.C_g2b(2,2) = sin(Nav.Phi)*sin(Nav.Theta)*sin(Nav.Psi) + cos(Nav.Phi)*cos(Nav.Psi);
Mat.C_g2b(2,3) = sin(Nav.Phi)*cos(Nav.Theta);
Mat.C_g2b(3,1) = cos(Nav.Phi)*sin(Nav.Theta)*cos(Nav.Phi) + sin(Nav.Phi)*sin(Nav.Psi);
Mat.C_g2b(3,2) = cos(Nav.Phi)*sin(Nav.Theta)*sin(Nav.Psi) - sin(Nav.Phi)*cos(Nav.Psi);
Mat.C_g2b(3,3) = cos(Nav.Phi)*cos(Nav.Theta);

Mat.Q_g2b(1,1) = 1 - 2 * (Nav.Q_2^2 + Nav.Q_3^2);
Mat.Q_g2b(1,2) = 2 * (Nav.Q_1 * Nav.Q_2 + Nav.Q_0 * Nav.Q_3);
Mat.Q_g2b(1,3) = 2 * (Nav.Q_1 * Nav.Q_3 - Nav.Q_0 * Nav.Q_2);
Mat.Q_g2b(2,1) = 2 * (Nav.Q_1 * Nav.Q_2 - Nav.Q_0 * Nav.Q_3);
Mat.Q_g2b(2,2) = 1 - 2 * (Nav.Q_1^2 + Nav.Q_3^2);
Mat.Q_g2b(2,3) = 2 * (Nav.Q_2 * Nav.Q_3 + Nav.Q_0 * Nav.Q_1);
Mat.Q_g2b(3,1) = 2 * (Nav.Q_1 * Nav.Q_3 + Nav.Q_0 * Nav.Q_2);
Mat.Q_g2b(3,2) = 2 * (Nav.Q_2 * Nav.Q_3 - Nav.Q_0 * Nav.Q_1);
Mat.Q_g2b(3,3) = 1 - 2 * (Nav.Q_1^2 + Nav.Q_2^2);

%  ��������ϵת����������ϵ
Mat.C_b2g = Mat.C_g2b.';
Mat.Q_b2g = Mat.Q_g2b.';
