function freesurfer_transSurfToNativeSpace(surf_ind,hemi_ind,theSubPath,outpath,prefix,output_format)
%cubic(B-Spline), trilin, nearest
if ~exist(outpath,'dir')
    mkdir(outpath);
end
[p,name,~]=fileparts(theSubPath);
precmd=['export LD_PRELOAD=/opt/software/glib-2.14/lib/libc-2.14.so;source /etc/profile; export FREESURFER_HOME=/opt/software/freesurfer7/freesurfer;export SUBJECTS_DIR=' p ';'];
system([precmd 'tkregister2 --mov ' theSubPath '/mri/rawavg.mgz --targ '...
    theSubPath '/mri/orig.mgz --reg '...
    outpath '/' prefix '.register.native.dat --noedit --regheader']);
if strcmp(output_format,'gii')
system([precmd 'mri_surf2surf --sval-xyz ' surf_ind ' --reg ' outpath '/' prefix '.register.native.dat ' theSubPath '/mri/rawavg.mgz'...
' --tval ' outpath '/' prefix '.surf.gii --tval-xyz ' theSubPath '/mri/rawavg.mgz --hemi ' hemi_ind ' --s ' name]);
elseif strcmp(output_format,'freesurfer')
system([precmd 'mri_surf2surf --sval-xyz ' surf_ind ' --reg ' outpath '/' prefix '.register.native.dat ' theSubPath '/mri/rawavg.mgz'...
' --tval ' outpath '/' prefix '.' hemi_ind '.' surf_ind ' --tval-xyz ' theSubPath '/mri/rawavg.mgz --hemi ' hemi_ind ' --s ' name]);
end