clc;
% Converts text files to  mat files

input_path = 'D:\CNN\C-3-Framework\datasets\NTU\data\test_data\images\';
output_path = 'D:\CNN\C-3-Framework\datasets\NTU\data\test_data\ground_truth\';

if ~exist(output_path, 'dir')
    mkdir(output_path);
end

input_files = dir(input_path);

num_images = size(input_files, 1);

for index=3:num_images
    index
    img_name = input_files(index).name;
    annPoints = importdata(strcat('D:\CNN\C-3-Framework\datasets\NTU\data\test_data\ground_truth\', strrep(img_name, 'png', 'txt')));
    save(strcat(output_path, strrep(img_name, 'png', 'mat')), 'annPoints')
end
% 
% I = csvread('D:\CNN\C-3-Framework\datasets\NTU\processed_data\train\den\ssc_2019_12_10_10_10_0_190.csv');
% % clims = [0 0.04];
% % J = imagesc(I,clims);
% imshow(I)
% colormap('jet')