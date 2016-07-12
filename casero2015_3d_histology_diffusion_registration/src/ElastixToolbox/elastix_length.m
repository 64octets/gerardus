function len = elastix_length(t)
% ELASTIX_LENGTH  Number of transform levels in an elastix series.
%
% LEN = ELASTIX_LENGTH(T)
%
%   LEN is the number of transforms in the T series. Do not mistake this
%   with the number of structs if T is a vector. For example, LEN=3 if we
%   have:
%
%   T.Transform = 'BSplineTransform';
%   T.Transform.InitialTransformParametersFileName.Transform = 'EulerTransform';
%   T.Transform.InitialTransformParametersFileName.InitialTransformParametersFileName.Transform = 'TranslationTransform';
%   T.Transform.InitialTransformParametersFileName.InitialTransformParametersFileName.InitialTransformParametersFileName = 'NoInitialTransform';

% Author: Ramon Casero <rcasero@gmail.com>
% Copyright © 2015 University of Oxford
% Version: 0.1.0
% 
% University of Oxford means the Chancellor, Masters and Scholars of
% the University of Oxford, having an administrative office at
% Wellington Square, Oxford OX1 2JD, UK. 
%
% This file is part of Gerardus.
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details. The offer of this
% program under the terms of the License is subject to the License
% being interpreted in accordance with English Law and subject to any
% action against the University of Oxford being under the jurisdiction
% of the English Courts.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

% check arguments
narginchk(1, 1);
nargoutchk(0, 1);

% counter of transform levels
len = 0;

if (isempty(t))
    return
end

while (true)
    
    % increase count of transform levels
    len = len + 1;
    
    % if this is the last level, we exit the loop
    if (strcmp(t(1).InitialTransformParametersFileName, 'NoInitialTransform'))
        break
    end
    
    % remove the top level
    t(:) = t(:).InitialTransformParametersFileName;
    
end
