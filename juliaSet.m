% Examples of usage and syntax:

%phi_0 = @(z) z^2;
%juliaSet(phi_0)

%phi_1 = @(z) z^2-1.25;
%juliaSet(phi_1)

%phi_2 = @(z) z^2+(0.36 + 0.1i);
%juliaSet(phi_2)

%phi_3 = @(z) z^2+(-0.123 - 0.745i);
%juliaSet(phi_3)

function juliaSet(phi)
c = phi(0);
fixpt1 = (1 + sqrt(1-4*c))/2;     % These are the fixed points.
fixpt2 = (1 - sqrt(1-4*c))/2;

colormap([1 0 0; 1 1 1]);     % Points numbered 1 (inside) will be colored red;
                              %   those numbered 2 (outside) will be colored white.
M = 2*ones(241,361);          % Initialize array of point colors to 2 (white).

for j=1:241                  % Try initial values with imaginary parts between
  y = -1.2 + (j-1)*.01;        %   -1.8 and 1.8
  for i=1:361                % and with real parts between
    x = -1.8 + (i-1)*.01;     %   -1.8 and 1.8.
    z = x + 1i*y;             % 1i is the MATLAB symbol for sqrt(-1).
    zk = z;
    iflag1 = 0;               % iflag1 and iflag2 count the number of iterations
    iflag2 = 0;               %   when a root is within 1.e-6 of a fixed point;
    kount = 0;                % kount is the total number of iterations.

    while kount < 100 && abs(zk) < 2 && iflag1 < 5 && iflag2 < 5
      kount = kount+1;
      zk = phi(zk);           % This is the fixed point iteration.
      err1 = abs(zk-fixpt1);  % Test for convergence to fixpt1.
      if err1 < 1.e-6
         iflag1 = iflag1 + 1;
      else
         iflag1 = 0;
      end
      err2 = abs(zk-fixpt2);  % Test for convergence to fixpt2.
      if err2 < 1.e-6
        iflag2 = iflag2 + 1;
      else
        iflag2 = 0;
      end
    end
    if iflag1 >= 5 || iflag2 >= 5 || kount >= 100   % If orbit is bounded, set this
      M(j,i) = 1;                                  %   point color to 1 (red).
    end
  end
end

image([-1.8 1.8],[-1.2 1.2],M),  % This plots the results.
axis xy                        % If you don't do this, vertical axis is inverted.
end

