# Neuroimage Synthesis and Registration

### By Travis Latchman


Synthesizing Fractional Anisotropy (FA) and Apparent Diffusion Coefficient (ADC) maps from T1-weighted (T1w) and T2-weighted (T2w)  MRI images is a complex task because these maps represent different types of information. T1w and T2w images primarily provide structural information about the brain, while FA and ADC maps, derived from Diffusion Tensor Imaging (DTI) data, provide information about the microstructural properties of tissues, specifically the diffusion of water molecules. However by employing deep learning algorithms and image synthesis techniques, we can learn a one-to-one image-to-image translation, where we can translate an image in one domain (T1w, andT2w) with other modalities.  

![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/8d7be78b-3627-40dc-981c-11b6fdc62893)  




**Code :**  

All files can just be simply opened, and then ran. For the .sh script, you can either follow directions placed at the top of the file, or you can copy the script in to a terminal window. 

* `skull_strip.sh` -   A terminal script that uses FSL's Brain Extraction Tool (BET) to skull-strip (remove non-brain tissue from) MRI images. It processes multiple image files organized by patient folders. It iterates over the images in each patient folder (from 1 to 200) in the given input directory. For each image, it creates a corresponding folder in the output directory and performs a skull-stripping operation using FSL's BET (Brain Extraction Tool). The script assumes that you have four types of images (ADC_deformed.nii.gz, FA_deformed.nii.gz, T1w_1mm.nii.gz, and T2w_1mm_noalign.nii.gz) in each patient's folder.

* `Registration.ipynb`  - a Python code snippet that performs intermodality registration on a set of medical images using the ANTs library. The purpose of the code is to align T1w, T2w, FA, and ADC images from different modalities. It loads the skull-stripped T1w, T2w, FA, and ADC images for each patient. We resampled the FA and ADC images to the same 1mm isotropic resolution as the T1w image. We then perform rigid registration of T2w, FA, and ADC images to the T1w image. We then perform non-rigid (SyN) registration of the FA and ADC images to the T1w image. We resample the registered FA and ADC images back to their original 1.25mm isotropic resolution and save the registered images to the output folder.'

* `UNet_Neuro.ipynb` - the notebook where we developed and trained a 3D U-Net architecture. It was trained to for the purposes of sythesizing FA and ADC maps from structural T1w and T2w MRI images. 
  
* `Attention_Neuro.ipynb` - the notebook where we developed and trained a 3D U-Net architecture with a local attention mechanism afer the bottleneck layer. It was trained to for the purposes of sythesizing FA and ADC maps from structural T1w and T2w MRI images. 

* `Residual_Neuro.ipynb` - the notebook where we developed and trained a 3D U-Net architecture with residual blocks. It was trained to for the purposes of sythesizing FA and ADC maps from structural T1w and T2w MRI images.


# Dataset "MedIA_Project2" -  (T1, T2, FA, and ADC images for 200 patients)  

![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/37679dfb-d8d9-44dd-b7b7-61880b9774cf)  

![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/25fc60b5-179e-4ae9-8bfc-4e3887998d54)  

"MedIA_Project2_registered" serves as input for the models


# Skull Stripping (FSL) 
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/518e2563-f56e-42d2-8e64-1586d7c25bdf)

![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/24c4d4c6-0746-42e9-ad83-1157ed294bd6)


# Registration (ANTs Package)

Registered T2w, FA, and ADC images to T1w-space  

![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/ba001c12-627c-42de-b2fe-5ef639866680)

![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/47edac0b-3061-4dba-8a3b-4551070c8d6e)


# Synthesis

![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/83e71c39-380a-4260-a5a7-87aec34a9e1c)

![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/67e0d95f-aa76-4067-b603-c2d141aa5417)  


# Results  
### U-Net images Patient 177
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/b4120637-dbf7-408a-83fb-912a4238bfd0)


### U-Net + Location Attention images Patient 177  
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/c59a16c7-5a35-4737-bf74-ccdf05466e03)
 

### U-Net + Residual images Patient 177  
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/6e447acd-f095-4fa3-a9aa-5092a37cd986)

  

TABLE I: Comparison of FA Synthesis - U-Net, U-Net + Local Attention, and U-Net + Residual Blocks
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/632399a9-f883-4ec3-a580-3f7dbab266f6)


TABLE II: Comparison of ADC Synthesis - U-Net, U-Net + Local Attention, and U-Net + Residual Blocks
![image](https://github.com/travislatchman/Neuroimage-Registration-and-Synthesis/assets/32372013/be021db2-2aa2-4f5b-984c-15741a13f9d2)


# Discussion and Conclusion

The experiment has shown that U-Net architectures, especially when combined with residual blocks or local attention mechanisms, can provide satisfactory results in the synthesis of FA images from multimodal MRI images. However, the varying performance metrics across the different models suggest that no single model excels in all areas, indicating that there might be room for further improvement or hybrid strategies. 

For FA synthesis, U-Net achieved an SSIM (Structural
Similarity Index Measure) of approximately 0.699, a PSNR
(Peak Signal-to-Noise Ratio) of around 14.83, an MSE (Mean
Squared Error) of roughly 0.033, and an MAE (Mean Absolute
Error) of about 0.076. This indicates a moderate performance
overall. The addition of local attention improved the SSIM
slightly to around 0.702, indicating a minor enhancement in
the perceived quality of the synthetic FA images. Interestingly,
the PSNR significantly decreased to approximately 9.37, indicating a higher amount of distortion compared to the UNet model. Both the MSE and MAE slightly decreased to
0.032 and 0.075, respectively, indicating a slight reduction
in error. The residual block addition resulted in a slightly
lower SSIM of about 0.695 compared to the other two models,
suggesting a slight decrease in image quality. However, this
model achieved a significantly higher PSNR of roughly 30.99,
indicating a lower level of distortion than both the U-Net and
U-Net + Local models. The MSE is slightly higher at around
0.034, and MAE is also the highest among the models at
approximately 0.077. The U-Net + Residual model achieves
the highest PSNR, indicating the least amount of distortion, but
it has the lowest SSIM, indicating lower structural similarity,
and highest MAE, indicating greater absolute error. The U-Net Local model slightly improves the SSIM and reduces MSE
and MAE compared to the original U-Net, but it dramatically
reduces the PSNR. If minimizing distortion is the top priority,
then the U-Net + Residual model would be the best. However,
if the focus is on a balance between structural similarity and
error measures, the U-Net + Local might be preferable.  


For ADC synthesis, U-Net has moderate performance. It has
the second highest SSIM of 0.954, indicating good structural
similarity between the synthesized images and the ground
truth. Its PSNR is the lowest among the models, meaning its
synthesized images might have higher amounts of noise or
distortion compared to the other models. Its MSE and MAE
values are also intermediate, implying a moderate amount of
error in the synthesized images. U-Net + Local Attention has
the highest SSIM of 0.957, suggesting it is best at preserving
the structure of the ground truth images in its synthesized
images. However, its PSNR is the second lowest, indicating
that it might still have a relatively high amount of noise or distortion. It has the lowest MSE and MAE, meaning that
on average, the differences between the pixel values of its
synthesized images and the ground truth are smallest among
the models. U-Net + Residual Blocks: has the highest PSNR
of 38.96, meaning it has the least amount of noise or distortion
among the models. However, it has the lowest SSIM of 0.952,
indicating that the structure of its synthesized images might
differ more from the ground truth than the other models. Its
MSE and MAE values are the highest, implying the largest
average differences between its synthesized images and the
ground truth. Based on these metrics, the best performing
model appears to be the U-Net + Local Attention. It has the
highest SSIM, suggesting the best structural similarity, and
the lowest MSE and MAE, indicating the smallest average
differences between its synthesized images and the ground truth. However, its relatively lower PSNR compared to the
U-Net + Residual Blocks model suggests that there might be
more noise or distortion in its synthesized images. Depending
on the specific requirements of the task, the U-Net + Residual
Blocks model might be preferable if minimizing noise and
distortion is a higher priority than maximizing structural
similarity and minimizing average error.












