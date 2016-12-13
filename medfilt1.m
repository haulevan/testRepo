function y = medfilt1(x,n)

% Check if the input arguments are valid
if isempty(n)
  n = 3;
end

% Reshape x into the right dimension.
% Work along the first non-singleton dimension
[x, nshifts] = shiftdim(x);

% Verify that the block size is valid.
siz = size(x);
blksz = siz(1); % siz(1) is the number of rows of x (default)

% Initialize y with the correct dimension
y = zeros(siz); 

% Call medfilt1D (vector)
for i = 1:prod(siz(2:end)),
	y(:,i) = medfilt1D(x(:,i),n,blksz);
end

% Convert y to the original shape of x
if isempty(DIM)
	y = shiftdim(y, -nshifts);
else
	y = ipermute(y,perm);
end
