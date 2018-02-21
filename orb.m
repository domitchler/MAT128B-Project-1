function orb(phi)
    zk = 0;
    kount = 0;                % kount is the total number of iterations.
    while kount < 100 && abs(zk) <= 100
      kount = kount+1;
      zk = phi(zk);           % This is the fixed point iteration.
    end
    if kount >= 100
        disp("Julia set is connected")
    else
        disp("Orbit is unbounded after " + kount + " iterations. Julia set is not connected.")
    end
end