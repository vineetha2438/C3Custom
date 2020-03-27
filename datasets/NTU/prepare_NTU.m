clc;
% dataset = 'B';
standard_size = [768,1024];

att = 'train';

path = ['NTU/data/' att '_data/images/'];
output_path = 'NTU/processed_data';
train_path_img = strcat(output_path,'/', att, '/img/');
train_path_den = strcat(output_path,'/', att, '/den/');

gt_path = ['NTU/data/' att '_data/ground_truth/'];

if ~exist(output_path, 'dir')
    mkdir(output_path)
end
if ~exist(train_path_img, 'dir')
    mkdir(train_path_img);
end
if ~exist(train_path_den, 'dir')
    mkdir(train_path_den);
end

% input_files = dir(path);
% num_images = size(input_files, 1);
% 
% for idx = 3:num_images
%     i = idx;
%     if (mod(idx,10)==0)
%         fprintf(1,'Processing %3d/%d files\n', idx, num_images);
%     end
%     input_img_name = input_files(idx).name;
    input_img_name = 'ssc_2019_12_10_10_10_0_190.png';
    load(strcat(gt_path, strrep(input_img_name, 'png', 'mat'))) ;
    im = imread(strcat('D:\CNN\C-3-Framework\datasets\NTU\data\train_data\images\', input_img_name));
    [h, w, c] = size(im);    
    
    rate = standard_size(1)/h;
    rate_w = w*rate;
    if rate_w>standard_size(2)
        rate = standard_size(2)/w;
    end
    rate_h = double(int16(h*rate))/h;
    rate_w = double(int16(w*rate))/w;
    im = imresize(im,[int16(h*rate),int16(w*rate)]);
    if(boolean(size(annPoints, 1)))
        annPoints(:,1) = annPoints(:,1)*double(rate_w);
        annPoints(:,2) = annPoints(:,2)*double(rate_h);

        im_density = get_density_map_gaussian(im,annPoints,15,4);
        im_density = im_density(:,:,1);
    else
        im_density = zeros(size(im)); 
        im_density = im_density(:,:,1);
    end
    
    imwrite(im, [train_path_img input_img_name]);
    csvwrite([train_path_den strrep(input_img_name, 'png', 'csv')], im_density);
% end

