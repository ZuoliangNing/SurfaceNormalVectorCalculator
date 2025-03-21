function [NormVector,OriginalZ,RotatedZ,OriginalVectors,RotatedVectors] ...
        = getSurfaceNormal( ...
            OriginalCoordinates , RotatedCoordinates , g )
% * get surface normal vector from coordinates of three points
%   before and after rotation of observing surface
% * the order of points should be counterclockwise
% OriginalCoordinates - of three points (2*3)
%                      in orignial coordinate system
% RotatedCoordinates - of three points (2*3)
%                      in rotated coordinate system
% a point cooresponds to a column
% the third component of a point's coord is unknown
% g - transfer matrix from orignial to rotated coordinate system

OriginalZ = sum( RotatedCoordinates - g(1:2,1:2) * OriginalCoordinates ) ...
    ./ ( g(1,3) + g(2,3) ) ;
OriginalCoordinates = [OriginalCoordinates;OriginalZ];
OriginalVectors = diff(OriginalCoordinates,1,2) ;
NormVector = cross(OriginalVectors(:,1),OriginalVectors(:,2)) ;
RotatedZ = g(3,:) * OriginalCoordinates;
RotatedVectors = g * OriginalVectors ;