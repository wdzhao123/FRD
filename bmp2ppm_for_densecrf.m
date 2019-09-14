function bmp2ppm_for_densecrf(t,th_lo,th_hi)
input_path = './test/test_net/';
save_path = './test/test_crf/';
di = dir([input_path,'*.bmp']);
for t = 1:length(di)
    th_hi= 120;  %%阈值分割参数(上)
    th_lo= 110;   %阈值分割参数(下)
    im = imread ([input_path,num2str(t),'.bmp']);
    [m,n] = size(im);
    mount = m*n;
    ms = sum(sum(im))/mount;
    th_lo = ms/100*th_lo;
    th_hi = ms/100*th_hi;
    for p = 1:m
        for q = 1:n
            im2(p,q,3) = 0;
            im2(p,q,2) = 0;
            im2(p,q,1) = 0;
        end
    end
    for p = 5:m-5
        for q = 5:n-5
            if im(p,q) > th_hi
                im2(p,q,1) = 64;
            else im2(p,q,1) = 0;
            end
        end
    end
    for p = 5:m-5
        for q = 5:n-5
            if im(p,q) < th_lo
                im2(p,q,2) = 128;
            else if im(p,q) > th_hi
                    im2(p,q,2) = 64;
                else
                    im2(p,q,2) = 0;
                end
            end
        end
    end
    imwrite(im2,[save_path,num2str(t),'.ppm']);
end