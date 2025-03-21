function OpenImageButtonPushedFcn(button,~,app)
StageIndex = find( strcmp(app.DropDown.Value,app.DropDown.Items));
switch StageIndex
    case 1 ; axe = app.UIAxes;
    case 2 ; axe = app.UIAxes2;
end
switch button.Text
    case 'Open'
        [file,path] = uigetfile({'*.tif';'*.png';'*.jpg'},'Open File'); 
        if ~file
            return
        end
        
        C = imread([path,file]);
        im = image(axe,C);
        im.PickableParts = 'none';
        if ishandle(app.Photos{StageIndex})
           delete(app.Photos{StageIndex})
        end
        app.Photos{StageIndex} = im;
        
        app.PhototFlag(StageIndex) = true;
        app.SelectButton.Enable = 'on';
        app.ClearButton.Enable = 'on';
%         axe.Visible = 'on';
        
        if all(app.PhototFlag)
            app.AdjustButton.Enable = 'on';
            app.SyncButton.Enable = 'on';
        end
    case 'Confirm'
            ind = app.CurrentAxe;
            delete(app.Scatters{ind,4})
            delete(app.Labels{ind,4})
            app.ScattersNumber(ind) = app.ScattersNumber(ind) + 1;
            app.Coords(2*ind-1:2*ind,app.ScattersNumber(ind)) = ...
                app.Coords(2*ind-1:2*ind,4);
            app.TableData{ind}(app.ScattersNumber(ind),1:2) = ...
                {num2str(app.Coords(2*ind-1,4),4), ...
                 num2str(app.Coords(2*ind,4),4)};
            my = app.Photos{ind}.YData(2);
            app.Scatters{ind,app.ScattersNumber(ind)} = ...
                scatter( axe, ...
                app.Coords(2*ind-1,4) , my - app.Coords(2*ind,4) , ...
                12 , 'r', 'filled' , ...
                'PickableParts','none');
            dev = diff(axe.XLim)*0.015;
            app.Labels{ind,app.ScattersNumber(ind)} = text( axe, ...
                app.Coords(2*ind-1,4)+dev , my - app.Coords(2*ind,4) , ...
                app.TextList{app.ScattersNumber(ind)}, ...
                'FontSize',17, ...
                'Color','r', ...
                'PickableParts','none');
            app.ClearButton.Enable = 'on';
        if app.ScattersNumber(ind) == 3
            app.SelectionFlag(ind) = true;
            VisibleUIControls(app,'on',button)
            app.SelectButton.Text = 'Select';
            app.SelectButton.Enable = 'off';
            app.OpenButton.Text = 'Open';
            app.UIAxes.ButtonDownFcn = [];
            app.UIAxes2.ButtonDownFcn = [];
            if app.ScattersNumber(3-ind) == 3
               app.CalculateButton.Enable = 'on'; 
            end
        end
    
end