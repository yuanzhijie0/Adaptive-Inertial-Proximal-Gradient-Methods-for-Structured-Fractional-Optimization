function varargout = normF(varargin)
varargout = cell(1, nargin);
Fmin = inf;
for i = 1:nargin
    Fmin = min(Fmin,min(varargin{i}));
end
Fmin = Fmin - 1e-3;
for i = 1:nargin
    varargout{i} = varargin{i} - Fmin;
end
