%%%%%% ���ж���ѧ����

% ��������ϵ�ٶȱ仯�ʣ����ٶȣ�
temp = cross([Body.u;Body.v;Body.w],[Body.p;Body.q;Body.r]) ...   % ������תǣ�����ٶ�
     + [Force.Fx;Force.Fy;Force.Fz]./Mass.Weight ...              % �������������γɵ�ֱ�Ӽ��ٶ�
     + Mat.C_g2b*[0;0;Earth.G];                                   % �������ٶ��ڻ������ϵķ���
Body.u_dot = temp(1,1);
Body.v_dot = temp(2,1);
Body.w_dot = temp(3,1);

% ��������ϵ���ٶȱ仯�ʣ��Ǽ��ٶȣ�
temp = inv(Mass.I) * (-cross([Body.p;Body.q;Body.r],Mass.I*[Body.p;Body.q;Body.r]) + [Force.Mx;Force.My;Force.Mz]);
Body.p_dot = temp(1,1);
Body.q_dot = temp(2,1);
Body.r_dot = temp(3,1);

% �Ի�������ϵ�ٶȱ仯�ʻ��ֻ���ٶȣ����ٶȱ仯�ʻ��ֻ�ý��ٶ�
Body.u = Math_integrate(Body_last.u,Body_last.u_dot,Body.u_dot,Sim.DT);
Body.v = Math_integrate(Body_last.v,Body_last.v_dot,Body.v_dot,Sim.DT);
Body.w = Math_integrate(Body_last.w,Body_last.w_dot,Body.w_dot,Sim.DT);
Body.p = Math_integrate(Body_last.p,Body_last.p_dot,Body.p_dot,Sim.DT);
Body.q = Math_integrate(Body_last.q,Body_last.q_dot,Body.q_dot,Sim.DT);
Body.r = Math_integrate(Body_last.r,Body_last.r_dot,Body.r_dot,Sim.DT);

% ����������ϵ�ٶ�ת������������ϵ
temp = Mat.C_b2g * [Body.u;Body.v;Body.w];
Nav.Vx = temp(1,1);
Nav.Vy = temp(2,1);
Nav.Vz = temp(3,1);

Nav.x = Math_integrate(Nav.x,Nav_last.Vx,Nav.Vx,Sim.DT);
Nav.y = Math_integrate(Nav.y,Nav_last.Vy,Nav.Vy,Sim.DT);
Nav.z = Math_integrate(Nav.z,Nav_last.Vz,Nav.Vz,Sim.DT);

% ����������ϵ���ٶ�תΪŷ���Ǳ仯��
Nav.Phi_dot = Body.p + tan(Nav.Theta)*(Body.q*sin(Nav.Phi)+Body.r*cos(Nav.Phi));
Nav.Theta_dot = Body.q*cos(Nav.Phi)-Body.r*sin(Nav.Phi);
Nav.Psi_dot = (Body.q*sin(Nav.Phi)+Body.r*cos(Nav.Phi))*sec(Nav.Theta);

Nav.Phi = Math_integrate(Nav.Phi,Nav_last.Phi_dot,Nav.Phi_dot,Sim.DT);
Nav.Theta = Math_integrate(Nav.Theta,Nav_last.Theta_dot,Nav.Theta_dot,Sim.DT);
Nav.Psi = Math_integrate(Nav.Psi,Nav_last.Psi_dot,Nav.Psi_dot,Sim.DT);