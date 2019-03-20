function ee_pos = FK_YouBot(q)
    lrz = 0.0722;
    l0z = 0.075;
    l0x = 0.033;
    l1 = 0.155;
    l2 = 0.135;
    l3 = 0.113;
    l4 = 0.105;
    l5 = l3+l4;

    d = [l0z+lrz 0 0 0 l5];
    t = [q(1) q(2)-pi/2 q(3) q(4)+pi/2 q(5)];
    alpha = [0 -pi/2 0 0 pi/2];
    a = [0 l0x l1 l2 0 0];
    
    H = eye(4);
    for i=1:5
        H = H*[cos(t(i)) -sin(t(i)) 0 a(i);
               sin(t(i))*cos(alpha(i)) cos(t(i))*cos(alpha(i)) -sin(alpha(i)) -sin(alpha(i))*d(i);
               sin(t(i))*sin(alpha(i)) cos(t(i))*sin(alpha(i)) cos(alpha(i)) cos(alpha(i))*d(i);
               0 0 0 1];
    end
    
    ee_pos = H*[0 0 -1 0; 0 1 0 0; 1 0 0 0; 0 0 0 1];

end

