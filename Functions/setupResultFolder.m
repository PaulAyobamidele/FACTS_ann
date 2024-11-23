function resultPath = setupResultFolder()
    % Function to create or reset the result folder
    filepath = cd;
    resultPath = fullfile(filepath, 'Result');
    if ~exist(resultPath, 'dir')
        mkdir(resultPath);
    else
        msg = {'Result folder exists!', 'Would you like to remove it?'};
        res = questdlg(msg, 'Delete Request', 'Yes', 'No', 'No');
        if strcmpi(res, 'Yes')
            rmdir(resultPath, 's');
            mkdir(resultPath);
        end
    end
end
