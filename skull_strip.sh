#!/bin/bash
# cd in terminal to directory 
# run " chmod +x skull_strip.sh " to make this saved script executable
# run " ./skull_strip.sh "



input_dir="/Users/travislatchman/Desktop/MedIA_Project2"
output_dir="/Users/travislatchman/Desktop/MedIA_Project2_stripped"

for i in $(seq -w 1 200); do
  # Create the corresponding patient folder in the output directory
  mkdir -p "${output_dir}/${i}"

  # Skull-strip each image using FSL's BET (Brain Extraction Tool)
  bet "${input_dir}/${i}/ADC_deformed.nii.gz" "${output_dir}/${i}/ADC_deformed.nii.gz" -R
  bet "${input_dir}/${i}/FA_deformed.nii.gz" "${output_dir}/${i}/FA_deformed.nii.gz" -R
  bet "${input_dir}/${i}/T1w_1mm.nii.gz" "${output_dir}/${i}/T1w_1mm.nii.gz" -R
  bet "${input_dir}/${i}/T2w_1mm_noalign.nii.gz" "${output_dir}/${i}/T2w_1mm_noalign.nii.gz" -R
done
