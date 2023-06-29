# Neuroimage Synthesis and Registration

### By Travis Latchman


Synthesizing Fractional Anisotropy (FA) and Apparent Diffusion Coefficient (ADC) maps from T1-weighted (T1w) and T2-weighted (T2w)  MRI images is a complex task because these maps represent different types of information. T1w and T2w images primarily provide structural information about the brain, while FA and ADC maps, derived from Diffusion Tensor Imaging (DTI) data, provide information about the microstructural properties of tissues, specifically the diffusion of water molecules. However by employing deep learning algorithms and image synthesis techniques, we can learn a one-to-one image-to-image translation, where we can translate an image in one domain (T1w, andT2w) with other modalities.


**Code :**  

All files can just be simply opened, and then ran. For the .sh script, you can either follow directions placed at the top of the file, or you can copy the script in to a terminal window. 

* `skull_strip.sh` -   A terminal script that uses FSL's Brain Extraction Tool (BET) to skull-strip (remove non-brain tissue from) MRI images. It processes multiple image files organized by patient folders. It iterates over the images in each patient folder (from 1 to 200) in the given input directory. For each image, it creates a corresponding folder in the output directory and performs a skull-stripping operation using FSL's BET (Brain Extraction Tool). The script assumes that you have four types of images (ADC_deformed.nii.gz, FA_deformed.nii.gz, T1w_1mm.nii.gz, and T2w_1mm_noalign.nii.gz) in each patient's folder.

* `Registration.ipynb`  - a Python code snippet that performs intermodality registration on a set of medical images using the ANTs library. The purpose of the code is to align T1w, T2w, FA, and ADC images from different modalities. It loads the skull-stripped T1w, T2w, FA, and ADC images for each patient. We resampled the FA and ADC images to the same 1mm isotropic resolution as the T1w image. We then perform rigid registration of T2w, FA, and ADC images to the T1w image. We then perform non-rigid (SyN) registration of the FA and ADC images to the T1w image. We resample the registered FA and ADC images back to their original 1.25mm isotropic resolution and save the registered images to the output folder.'

* `UNet_Neuro.ipynb` - the notebook where we developed and trained a 3D U-Net architecture. It was trained to for the purposes of sythesizing FA and ADC maps from structural T1w and T2w MRI images. 
  
  * `Attention_Neuro.ipynb` - the notebook where we developed and trained a 3D U-Net architecture with a local attention mechanism afer the bottleneck layer. It was trained to for the purposes of sythesizing FA and ADC maps from structural T1w and T2w MRI images. 

* `Residual_Neuro.ipynb` - the notebook where we developed and trained a 3D U-Net architecture with residual blocks. It was trained to for the purposes of sythesizing FA and ADC maps from structural T1w and T2w MRI images. 
