



img = mscan;

%img_subset = img(:, 1:10:1339450);



fileID = fopen('data/oct_timestamp_2.bin');
A = fread(fileID, Inf, 'uint64');
xTime = (A(end) - A(1)) / (size(A, 1)) / 50 / 1000; %seconds per A-scan
revTime = (1/8.75);
bscanSize = round(revTime / xTime);
fclose(fileID);

N = 20;
img_subset = img(:, 600001:(600000 + N*bscanSize));
img_subset = imgaussfilt(img_subset, 3);

cscan = reshape(img_subset, [512, bscanSize, N]);

figure
colormap gray
imagesc(cscan(:,:,5))

%[X Y] = pol2cart( cscan(:,:,2));
%S = surf(X,Y,ones(size(X))); 
S = PolarToIm(cscan(:,:,5), 0, 1, 1024, 1024); 
figure
colormap gray
%imagesc(img_subset)
imagesc(S)
%imagesc(cscan(:,:,8))