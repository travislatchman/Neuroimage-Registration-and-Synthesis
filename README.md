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


## Dataset (T1, T2, FA, and ADC images for 200 patients)
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/90b09d7d-40f2-480c-812d-872b99429846)
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/affa6efc-bbf2-4332-941a-bc0dcac02489)  


## Skull Stripping  
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/fc323197-d9a3-4e13-872a-52b90c099fd4)  
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/15f513fc-5dab-4077-b832-2a25b4a8f2de)  


## Registration
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/b28c2005-639a-4460-87ad-719dab1cb1fa)  
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/22eb6124-6b09-472d-9e06-caf289c9049b)  


## Synthesis

![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/63154976-86a7-4cc9-85a9-27a80e184f22)  
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/67e0d95f-aa76-4067-b603-c2d141aa5417)  


## Results  
### U-Net images Patient 177
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/cfccb70d-7908-44ca-b918-a4571f7eb39b)  

### U-Net + Location Attention images Patient 177  
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/c34f9407-71ef-4923-ae4f-518df1fcc6fe)  

### U-Net + Residual images Patient 177  
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/112a8879-2312-4294-bd1d-44b4c05ae3ae)  
  

TABLE I: Comparison of FA Synthesis - U-Net, U-Net + Local Attention, and U-Net + Residual Blocks
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/9f9a9811-907e-4f4b-abb5-43a6fc7a414f)

TABLE II: Comparison of ADC Synthesis - U-Net, U-Net + Local Attention, and U-Net + Residual Blocks
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/d2a82610-a022-4b29-b695-db029bccc8d9)  
















