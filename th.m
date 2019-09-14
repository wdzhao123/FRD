function th()
input_path = './test/test_crf/';
save_path = './test/test_final/';
di = dir('./test/test_image/*.jpg');
for t = 1:length(di)
    im = imread([input_path,'b',num2str(t),'.ppm']);
    [m,n,z] = size(im);
    im3 = zeros(m,n);
    for p = 1:m
        for q = 1:n
            if im(p,q,1) > 40
                im3(p,q) = 255;
            else im3(p,q) = 0;
            end
        end
    end
    imwrite(im3,[save_path,num2str(t),'.bmp']);
end
end