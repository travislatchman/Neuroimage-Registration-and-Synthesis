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

## Discussion and Conclusion

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
and highest MAE, indicating greater absolute error. The U-Net
+ Local model slightly improves the SSIM and reduces MSE
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












