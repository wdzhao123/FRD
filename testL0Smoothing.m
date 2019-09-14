clc;
clear all;
source_path = './test/test_image/';
save_path = './test/test_LOS/';
di = dir([source_path,'*.jpg']);
for n = 1:length(di)
    Im = imread([source_path,num2str(n),'.jpg']);
    S = L0Smoothing(Im,0.03);
    imwrite(S,[save_path,num2str(n),'.ppm']);

end
