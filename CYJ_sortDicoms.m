function CYJ_sortDicoms(dicoms,ouputFolder)
nonDcm={};
iCount=1;
for i = 1:length(dicoms)
    try
        temp = dicominfo(dicoms{i});
    catch
        nonDcm{iCount,1}=dicoms{i};
        iCount=iCount+1;
        break
    end
        paths = [regexprep(temp.SeriesDescription,' ','_'),num2str(temp.SeriesNumber)];
        if ~exist([ ouputFolder,'/' paths],'dir')
            mkdir([ouputFolder,'/' paths])
        end
        movefile(dicoms{i},[ ouputFolder,'/' paths]);
  
            
end
disp(['There are ' num2str(iCount) ' non-dicom files in this folder']);