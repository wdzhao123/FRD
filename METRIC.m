function METRIC
clear,clc
input_path1 = './test/test_final/';
input_path2 = './test/test_gt/';
M = length(dir([input_path1,'*.bmp']));
score_IoU = double(zeros(M,1));
score_acc = double(zeros(M,1));
for t = 1:M
    im1 = imread([input_path1,num2str(t),'.bmp']);
    im2 = imread([input_path2,num2str(t),'.bmp']);
    [m,n] = size(im1);
    TP = 0; FP = 0; FN = 0; TN = 0; T = 0; F = 0;P = 0;N = 0;
    for p = 1:m
        for q = 1:n
            if im1(p,q) > 0 && im2(p,q) > 0
                TP = TP+1;
            end
            if im1(p,q) == 0 && im2(p,q) == 0
                TN = TN+1;
            end
            if im1(p,q) > 0 && im2(p,q) == 0
                FP = FP+1;
            end
            if im1(p,q) == 0 && im2(p,q) > 0
                FN = FN+1;
            end
        end
    end
    T = TP+FN; F = FP+TN;
    P = TP+FP; N = FN+TN;
    score_IoU(t,1) = TP/(FN+TP+FP);
    score_acc(t,1) = (TP+TN)/(P+N);
end
mIoU = sum(score_IoU)/M
mACC = sum(score_acc)/M
end