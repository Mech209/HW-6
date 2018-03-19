clear
clc
close
N = 10;
L = pi();
h = L/(N);
M = 1;
A_d = eye(N-1)*(-4*N);
A_d = A_d + diag(ones(N-2,1),1)*N;
A_d = A_d + diag(ones(N-2,1),-1)*N;
Aoff = eye(N-1)*N;
A = sparse((N-1)*(N-1), (N-1)*(N-1));
for i = 1:N-1
    A((i-1)*(N-1)+1:(i-1)*(N-1)+(N-1), (i-1)*(N-1)+1:(i-1)*(N-1)+(N-1)) = A_d;
end
for i = 2:N-1
   A((i-2)*(N-1)+1:(i-2)*(N-1)+(N-1), (i-1)*(N-1) +1:(i-1)*(N-1)+(N-1)) = Aoff;
   A((i-1)*(N-1) +1:(i-1)*(N-1)+(N-1), (i-2)*(N-1)+1:(i-2)*(N-1)+(N-1)) = Aoff;
end
f = zeros();
for i = 1:N-1
    x = i*h;
    for j = 1:N-1
        y = j*h;
f(i,j) = -2*M*sin(M*x)*cosh(M*y);
    end 
end
f_new = reshape(f, [81,1]);
u = A\f_new; 
u = reshape(u, 9,9);

%Exact
u_exact = zeros();
for i = 1:N-1
    x = i*h;
    for j = 1:N-1
        y = j*h;
      u_exact(i,j) = (L-y)*sin(M*x)*sinh(M*y);
    end
end

%L1 error
err = u_exact - u;

%Plot u at a few y values
hold on
plot()
plot(u,L/2)
plot(u,3*L/4)
%Plot u at a few x values
plot(L/4,u)
plot(L/2,u)
plot(3*L/4, u)