clc;
clear all;
addpath(genpath('/home/yxb/caffe-master'));
source_path = './test/test_image/';
save_path = './test/test_net/';
di = dir([source_path,'*.jpg']);
tic;
for n = 1:length(di)
    caffe.reset_all();
    caffe.set_mode_gpu();
    caffe.set_device(0);
    im0 = imread([source_path,num2str(n),'.jpg']);
    model_def_file = './test.prototxt';
    model_file = './parameter/final.caffemodel';
    use_gpu = 1;
    net = caffe.Net(model_def_file,'test');
    net.copy_from(model_file);
    map = FRD(im0,net);
    imwrite(map,[save_path,num2str(n),'.bmp']);
end
toc;
