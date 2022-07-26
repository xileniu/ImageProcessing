This repository contains some useful scripts for image processing.
<br><br>
* afni_save_png.m: <br>
Using afni to automatically generate slice images, saving manual clicks, pretty useful. see Figure2 in https://doi.org/10.1177/0271678X211036606

* CYJ_sortDicoms.m: <br>
Sorting dicoms according to the 'SeriesDescription' and 'SeriesNumber' when they are in a mess
* ZCX_CYJ_parameters.m: <br>
Reading useful MRI parameters from the dicoms


* freesurfer_transSurfToNativeSpace.m: <br>
Trasforming surfaces in freesurfer space back to native space

* transVolumeToFreesurferSpace.m: <br>
Trasforming volumes in freesurfer space back to native space

* meshVolumeToObj.m: <br>
Converting nifti format images to obj format surfaces for display in  software like surfICE. see Figure 3 in https://doi.org/10.1177/0271678X211036606

