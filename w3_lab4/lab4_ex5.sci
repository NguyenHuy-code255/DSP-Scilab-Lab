// Tai thu vien xu ly anh IPCV
atomsLoad('IPCV');

// 1. Doc anh tu thu vien anh mau co san cua IPCV (baboon.png)
img_path = fullpath(getIPCVpath() + "/images/baboon.png");
img = imread(img_path);

// 2. Chuyen anh mau (RGB) sang anh xam (Grayscale)
gray_img = rgb2gray(img);

// 3. Thuc hien can bang Histogram (Histogram Equalization)
eq_img = imhistequal(gray_img);

// 4. Hien thi ket qua so sanh tren cung mot cua so figure
scf(0);
clf();

// Hien thi anh xam goc
subplot(2, 2, 1);
imshow(gray_img);
title('Anh xam goc');

// Tinh va ve Histogram anh goc
subplot(2, 2, 2);
hist_gray = imhist(gray_img);
plot(0:255, hist_gray');
title('Histogram anh goc');
xlabel('Muc xam');
ylabel('So luong pixel');

// Hien thi anh sau khi can bang
subplot(2, 2, 3);
imshow(eq_img);
title('Anh sau khi can bang Histogram');

// Tinh va ve Histogram sau khi can bang
subplot(2, 2, 4);
hist_eq = imhist(eq_img);
plot(0:255, hist_eq');
title('Histogram sau khi can bang');
xlabel('Muc xam');
ylabel('So luong pixel');

