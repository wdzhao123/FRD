function map = FRD(im0,net)
[m n k]=size(im0);
size_im=320;
input_data = {prepare_image(im0,size_im)};
net.forward(input_data);
scores = net.blobs('map').get_data();
scores = scores(:,:,1,:);
scores = squeeze(scores);
map=uint8(scores*255);
end


function images = prepare_image(im0,size_im)
IMAGE_DIM = size_im;
im0 = single(im0);
% mean BGR pixel
mean_pix = [103.939, 116.779, 123.68];
im0 = imresize(im0, [IMAGE_DIM IMAGE_DIM]);
% RGB -> BGR
im0 = im0(:, :, [3 2 1]);
images(:,:,1:3,1)=im0;
% mean BGR pixel subtraction
for c = 1:3
    images(:, :, c, :) = images(:, :, c, :) -mean_pix(c) ;%mean_pix(c)
end
end
