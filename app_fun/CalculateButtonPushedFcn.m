function CalculateButtonPushedFcn(~,~,app)
OriginalCoordinates = app.Coords(1:2,1:3);
RotatedCoordinates = app.Coords(3:4,1:3);
angle = app.EditField.Value / 180 * pi ; % rad
axis = find( strcmp(app.DropDown_2.Value,app.DropDown_2.Items));
% 1-X , 2-Y
direction = find([app.DirectionButtonGroup.Children.Value]);
% 2-clockwise , 1-anticlockwise
if direction == 2
   angle = - angle; 
end
if axis == 1 % X
    EulerAngles = [0,angle,0];
else % Y
    EulerAngles = [pi/2,angle,-pi/2];
end
g = Euler2Matrix(EulerAngles)';
[NormVector,OriginalZ,RotatedZ,OriginalVectors,RotatedVectors] ...
    = getSurfaceNormal( ...
        OriginalCoordinates , RotatedCoordinates , g );
UnitNormVector = NormVector / norm(NormVector) ;
N_angles = acosd(abs(UnitNormVector));

if ishandle(app.Lines{1})
   cellfun(@(obj)delete(obj),app.Lines) 
end
Length = mean(vecnorm(OriginalVectors));
my = app.Photos{1}.YData(2);
Bx = OriginalCoordinates(1,2); By = my - OriginalCoordinates(2,2);
app.Lines{1} = line(app.UIAxes, ...
            [Bx,Bx+Length*UnitNormVector(1)], ...
            [By,By-Length*UnitNormVector(2)], ...
            'Color','g', ...
            'LineWidth',1.5);
RotatedNormVector = g * NormVector ;
RotatedNormVector = RotatedNormVector / norm(RotatedNormVector) ;
Length = mean(vecnorm(RotatedVectors));
my = app.Photos{2}.YData(2);
Bx = RotatedCoordinates(1,2); By = my - RotatedCoordinates(2,2);
app.Lines{2} = line(app.UIAxes2, ...
            [Bx,Bx+Length*RotatedNormVector(1)], ...
            [By,By-Length*RotatedNormVector(2)], ...
            'Color','g', ...
            'LineWidth',1.5);

    
fun = @(num)num2str(num,4);
app.TableData{1}(1:3,3) = ...
    arrayfun(fun,OriginalZ,'UniformOutput',false);
app.TableData{1}(4,:) = ...
    arrayfun(fun,OriginalVectors(:,1),'UniformOutput',false)';
app.TableData{1}(5,:) = ...
    arrayfun(fun,OriginalVectors(:,2),'UniformOutput',false)';
app.TableData{2}(1:3,3) = ...
    arrayfun(fun,RotatedZ,'UniformOutput',false);
app.TableData{2}(4,:) = ...
    arrayfun(fun,RotatedVectors(:,1),'UniformOutput',false)';
app.TableData{2}(5,:) = ...
    arrayfun(fun,RotatedVectors(:,2),'UniformOutput',false)';

fun = @(num)num2str(num,3);
temp = arrayfun(fun,UnitNormVector,'UniformOutput',false)';
app.TableData{1}(6,:) = temp ;
app.TableData{2}(6,:) = temp ;

fun = @(num)[num2str(num,2),'°'];
temp = arrayfun(fun,N_angles,'UniformOutput',false)';
app.TableData{1}(7,:) = temp ;
app.TableData{2}(7,:) = temp ;

ind = app.CurrentAxe;
app.UITable.Data = app.TableData{ind};