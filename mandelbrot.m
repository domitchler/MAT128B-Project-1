% Generates the Mandelbrot set associated with phi(z) = z^2 + c.

colormap(parula(100));
M = zeros(241,361);
for j=1:241                  % Try initial values with imaginary parts between
    y = -1.2 + (j-1)*.01;        %   -1.2 and 1.2
    for i=1:361                % and with real parts between
        x = -2.3 + (i-1)*.01;     %   -2.3 and 1.3.
        c = x + 1i*y;             % 1i is the MATLAB symbol for sqrt(-1).
        kount = 0;                % kount is the total number of iterations.
        phi = @(z) z^2 + c;
        z = 0;
        while kount < 100 && abs(z) <= 100
            kount = kount+1;
            z = phi(z);           % This is the fixed point iteration.
        end
        M(j,i) = kount;
    end
end
image([-2.3 1.3],[-1.2 1.2],M),  % This plots the results.
axis xy                        % If you don't do this, vertical axis is inverted.
