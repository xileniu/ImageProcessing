function meshVolumeToObj(volume,valueInVolume,outpath,prefix)
if ~exist(outpath,'dir')
    mkdir(outpath);
end
% generate the mesh
system(['mri_tessellate ' volume ' ' num2str(valueInVolume) ' ' outpath '/' prefix]);
% smooth  have to do it
system(['mris_smooth -nw ' outpath '/' prefix ' ' outpath '/' prefix]);
% convert to ASCII
system(['mris_convert ' outpath '/' prefix ' ' outpath '/' prefix '.asc']);
% change sufix
system(['mv ' outpath '/' prefix '.asc ' outpath '/' prefix '.srf']);
% to obj
system(['/mnt/data2/chenyijun/code/my_function/srf2obj.sh ' outpath '/' prefix '.srf > ' outpath '/' prefix '.obj']);
