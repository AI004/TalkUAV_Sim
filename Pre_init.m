%%%%% ��������ͳ�ʼ���ļ�

%%%%% ����ʱ�䲽��
Sim.DT = 0.01;              % ���沽��
Sim.T = 10;                 % ������ʱ��
Sim.Time = 0:Sim.DT:Sim.T;          % ����ʱ������
Sim.n = length(Sim.Time);   % ��ʱ�������

%%%%% ���������������ʼ��
Metric.Span = 10.91;
Metric.Chord = 1.49;
Metric.WingArea = 16.17;

Mass.Weight = 844;
Mass.Ixx = 1285;
Mass.Ixy = 0;
Mass.Ixz = 0;
Mass.Iyx = 0;
Mass.Iyy = 1825;
Mass.Iyz = 0;
Mass.Izx = 0;
Mass.Izy = 0;
Mass.Izz = 2667;

Mass.I = [Mass.Ixx Mass.Ixy Mass.Ixz;Mass.Iyx Mass.Iyy Mass.Iyz;Mass.Izx Mass.Izy Mass.Izz];

%%%%% ���������ز�����ʼ��
Earth.G0 = 9.81;
Earth.G = Earth.G0;
Earth.Omega = 0;

%%%%% ������ز�����ʼ�� 
Aero.Rou0 = 1.29;
Aero.Rou = Aero.Rou0;
Aero.Qbar = 0;

%%%%% ״̬������ʼ��
% ����Ǧ��������������ϵ��������γ�ȡ�ŷ���ǵ�
Nav.Lat = 0;                    % γ��
Nav.Lon = 0;                    % ����
Nav.Alt = 1000;                 % �߶�
Nav.Phi = -0.7;                  % ��ת��
Nav.Theta = -0.9;                % ������
Nav.Psi = 1.6;                  % ƫ����
Nav.Phi_dot = 0;                % ��ת�Ǳ仯��
Nav.Theta_dot = 0;              % �����Ǳ仯��
Nav.Psi_dot = 0;                % ƫ���Ǳ仯��
Nav.x = 0;                      % X�����꣬��Ϊ��
Nav.y = 0;                      % Y�����꣬��Ϊ��
Nav.z = -Nav.Alt;               % Z�����꣬����Ϊ��
Nav.V = 0;                      % ���ٶ�
Nav.Vg = 0;                    % ����
Nav.Vx = Nav.Vg * cos(Nav.Psi);	% X���ٶȣ���Ϊ��
Nav.Vy = Nav.Vg * sin(Nav.Psi);	% Y���ٶȣ���Ϊ��
Nav.Vz = 0;                     % Z���ٶȣ�����Ϊ��
Nav.Vx_dot = 0;                 % X����ٶȣ���Ϊ��
Nav.Vy_dot = 0;                 % Y����ٶȣ���Ϊ��
Nav.Vz_dot = 0;                 % Z����ٶȣ�����Ϊ��

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
Nav_Array.Vg = zeros(Sim.n,1); 
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

%%%%% ����任�����ʼ��
%  ��������ϵת����������ϵ
Mat.C_g2b(1,1) = cos(Nav.Theta)*cos(Nav.Psi);
Mat.C_g2b(1,2) = cos(Nav.Theta)*sin(Nav.Psi);
Mat.C_g2b(1,3) = -sin(Nav.Theta);
Mat.C_g2b(2,1) = sin(Nav.Phi)*sin(Nav.Theta)*cos(Nav.Psi) - cos(Nav.Phi)*sin(Nav.Psi);
Mat.C_g2b(2,2) = sin(Nav.Phi)*sin(Nav.Theta)*sin(Nav.Psi) + cos(Nav.Phi)*cos(Nav.Psi);
Mat.C_g2b(2,3) = sin(Nav.Phi)*cos(Nav.Theta);
Mat.C_g2b(3,1) = cos(Nav.Phi)*sin(Nav.Theta)*cos(Nav.Psi) + sin(Nav.Phi)*sin(Nav.Psi);
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

%  ��������ϵ״̬����
Body.p = 0.1;                                               % ��X�ᣨ��ת�����ٶ�
Body.q = 0.1;                                               % ��Y�ᣨ���������ٶ�
Body.r = 0.1;                                               % ��Z�ᣨƫ�������ٶ�
Body.u = Mat.C_g2b(1,:) * [Nav.Vx;Nav.Vy;Nav.Vz];           % X���ٶ�
Body.v = Mat.C_g2b(2,:) * [Nav.Vx;Nav.Vy;Nav.Vz];           % Y���ٶ�
Body.w = Mat.C_g2b(3,:) * [Nav.Vx;Nav.Vy;Nav.Vz];           % Z���ٶ�
Body.p_dot = 0;                                             % ��X�ᣨ��ת���Ǽ��ٶ�
Body.q_dot = 0;                                             % ��Y�ᣨ�������Ǽ��ٶ�
Body.r_dot = 0;                                             % ��Z�ᣨƫ�����Ǽ��ٶ�
Body.u_dot = 0;                                             % X����ٶ�
Body.v_dot = 0;                                             % Y����ٶ�
Body.w_dot = 0;                                             % Z����ٶ�

Body_last = Body;                                           % ��һ�����ڵĻ�������ϵ״̬

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


%  ��¼�������ò���
Force_Array.Fx = zeros(Sim.n,1);
Force_Array.Fy = zeros(Sim.n,1);
Force_Array.Fz = zeros(Sim.n,1);
Force_Array.Mx = zeros(Sim.n,1);
Force_Array.My = zeros(Sim.n,1);
Force_Array.Mz = zeros(Sim.n,1);


%%%%% �����������ز���
Sensor.Acc_x = 0;               % X����ٶȼ����
Sensor.Acc_x_bias = 0;          % X����ٶȼ����Ư��
Sensor.Acc_x_scale = 0;         % X����ٶȼƿ̶�����
Sensor.Acc_x_noise = 0;         % X����ٶȼƸ�˹��������

Sensor.Acc_y = 0;               % Y����ٶȼ����
Sensor.Acc_y_bias = 0;          % Y����ٶȼ����Ư��
Sensor.Acc_y_scale = 0;         % Y����ٶȼƿ̶�����
Sensor.Acc_y_noise = 0;         % Y����ٶȼƸ�˹��������

Sensor.Acc_z = 0;               % Z����ٶȼ����
Sensor.Acc_z_bias = 0;          % Z����ٶȼ����Ư��
Sensor.Acc_z_scale = 0;         % Z����ٶȼƿ̶�����
Sensor.Acc_z_noise = 0;         % Z����ٶȼƸ�˹��������

Sensor.Gyr_x = 0;               % X�����������
Sensor.Gyr_x_bias = 0;          % X�����������Ư��
Sensor.Gyr_x_scale = 0;         % X�������ǿ̶�����
Sensor.Gyr_x_noise = 0;         % X�������Ǹ�˹��������

Sensor.Gyr_y = 0;               % Y�����������
Sensor.Gyr_y_bias = 0;          % Y�����������Ư��
Sensor.Gyr_y_scale = 0;         % Y�������ǿ̶�����
Sensor.Gyr_y_noise = 0;         % Y�������Ǹ�˹��������

Sensor.Gyr_z = 0;               % Z�����������
Sensor.Gyr_z_bias = 0;          % Z�����������Ư��
Sensor.Gyr_z_scale = 0;         % Z�������ǿ̶�����
Sensor.Gyr_z_noise = 0;         % Z�������Ǹ�˹��������

Sensor.GPS_n = 0;
Sensor.GPS_n_tor = 0;
Sensor.GPS_n_noise = 0;

Sensor.GPS_e = 0;
Sensor.GPS_e_tor = 0;
Sensor.GPS_e_noise = 0;

Sensor.GPS_d = 0;
Sensor.GPS_d_tor = 0;
Sensor.GPS_d_noise = 0;

Sensor.GPS_Vn = 0;
Sensor.GPS_Vn_tor = 0;
Sensor.GPS_Vn_noise = 0;

Sensor.GPS_Ve = 0;
Sensor.GPS_Ve_tor = 0;
Sensor.GPS_Ve_noise = 0;

Sensor.GPS_Vd = 0;
Sensor.GPS_Vd_tor = 0;
Sensor.GPS_Vd_noise = 0;