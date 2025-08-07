E=1/(3e8);
g=0.1;
t=0;
dt=0.01;
x=0;
y=0;
z=0;
v_x=0;
v_y=0;
v_z=0;
T = zeros(1,1000000);
X = zeros(1,1000000);
Y = zeros(1,1000000);
Z = zeros(1,1000000);
V_Z = zeros(1,1000000);

for i=1:1000000
    t=i*dt-0.01;
    T(i) = t;
    X(i) = x;
    Y(i) = y;
    Z(i) = z;
    V_Z(i) = v_z;
    
    a_x = E*cos(z-t)*(1-v_z)-g*v_x;
    a_y = -g*v_y;
    a_z = E*v_x*cos(z-t)-g*v_z;
    
    v_x_t = v_x + a_x*dt/2;
    v_y_t = v_y + a_y+dt/2;
    v_z_t = v_z + a_z*dt/2;
    
    x_t = x + v_x*dt/2;
    y_t = y + v_y*dt/2;
    z_t = z + v_z*dt/2;
    
    a_x_t = E*cos(z_t-(t+dt/2))*(1-v_z_t)-g*v_x_t;
    a_y_t = -g*v_y_t;
    a_z_t = E*v_x_t*cos(z_t-(t+dt/2))-g*v_z_t;
    
    v_x = v_x + a_x_t*dt;
    v_y = v_y + a_y_t*dt;
    v_z = v_z + a_z_t*dt;
    
    x = x + v_x_t*dt;
    y = y + v_y_t*dt;
    z = z + v_z_t*dt;   
end
figure(1)
subplot(221)
plot(X,Z);
xlabel("X","FontSize",20);
ylabel("Z","FontSize",20);
title("Z and X","FontSize",25);
subplot(222)
plot(T,Z);
xlabel("Time","FontSize",20);
ylabel("Z","FontSize",20);
title("Z","FontSize",25);
subplot(212)
plot(T,X);
xlabel("Time","FontSize",20);
ylabel("X","FontSize",20);
title("X","FontSize",25);

T_Avg = 0:0.01:(floor(2*pi*100)/100);
V_z_avg = [0 0];
for j=100*numel(T_Avg):101*numel(T_Avg)
    V_z_avg=V_Z(j);
end
average = mean(V_z_avg);
average2 = mean(V_Z)