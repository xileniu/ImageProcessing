function [T1] = ZCX_CYJ_parameters(input_path)
% input should be cell or cells
T1=table;
for i = 1:length(input_path)
    if ~isempty(input_path{i})
        % adjust according to your data type
        tmp = g_ls([input_path{i} '/*.dcm']);
        if isempty(tmp)
            tmp = g_ls([input_path{i} '/*.IMA']);
        end
        if isempty(tmp)
            tmp = g_ls([input_path{i} '/*']);
        end
        % adjust according to your data type
        
        input_path_dicom = tmp{1};
        T1_temp = dicominfo(input_path_dicom);
        T1.DICOM_PATH{i,1}=fileparts(input_path_dicom);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        try
            T1.Manufacturer{i,1} = (T1_temp.Manufacturer);
            T1.ManufacturerModelName{i,1} = (T1_temp.ManufacturerModelName);
            T1.MaganeticFieldStrength{i,1} = (T1_temp.MagneticFieldStrength);
        catch
            T1.Manufacturer{i,1} = [];
            T1.ManufacturerModelName{i,1} = [];
            T1.MaganeticFieldStrength{i,1} = [];
        end
        %
        try
            T1.SeriesDescription{i,1} = [regexprep(T1_temp.SeriesDescription,' ','_'),num2str(T1_temp.SeriesNumber)];
        catch
            T1.SeriesDescription{i,1} = [];
        end
        %
        T1.numOfDicom{i,1}=length(tmp);
        %
        try
            T1.StationName{i,1} = (T1_temp.StationName);
        catch
            T1.StationName{i,1} = [];
        end
        %
        try
            T1.DeviceSerialNumber{i,1} = (T1_temp.DeviceSerialNumber);
        catch
            T1.DeviceSerialNumber{i,1} = [];
        end
        %
        try
            T1.TR{i,1} = (T1_temp.RepetitionTime);
            T1.TE{i,1} = (T1_temp.EchoTime);
            T1.FlipAngle{i,1} = (T1_temp.FlipAngle);
            T1.AcquisitonMatrix{i,1} = (T1_temp.AcquisitionMatrix);
            T1.SliceThickness{i,1} = (T1_temp.SliceThickness);
        catch
            T1.TR{i,1} = [];
            T1.TE{i,1} = [];
            T1.FlipAngle{i,1} = [];
            T1.AcquisitonMatrix{i,1} = [];
            T1.SliceThickness{i,1} = [];
        end
        %
        try
            T1.SpacingBetweenSlices{i,1} = (T1_temp.SpacingBetweenSlices);
        catch
            T1.SpacingBetweenSlices{i,1} = [];
        end
        %
        try
            T1.PixelSpacing{i,1} = (T1_temp.PixelSpacing);
        catch
            T1.PixelSpacing{i,1} = [];
        end
        %
        try
            T1.InPlanePhaseEncodingDirection{i,1} = (T1_temp.InPlanePhaseEncodingDirection);
        catch
            T1.InPlanePhaseEncodingDirection{i,1} = [];
        end
        %T1.InstitutionAddress{i,1} = (T1_temp.InstitutionAddress);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% add it if you need it
        %     T1.Name{i,1} = T1_temp.PatientName.FamilyName;% may different
             T1.BirthDate{i,1} = (T1_temp.PatientBirthDate);
             T1.Sex{i,1} = T1_temp.PatientSex;
             T1.scanDate{i,1} = T1_temp.StudyDate;
        %     T1.Age{i,1} = T1_temp.PatientAge;
        
        
        display( ['The ',num2str(i),'th Sub has been done !']);
    end
end
