A = rgb2gray(imread('rabbit.jpg'));
figure(1);
imshow(A);
[U,S,V] = svd(double(A));
r = 10;
A10 = U(:,1:r) * S(1:r,1:r) * (V(:,1:r))';
figure(2);
imshow(uint8(A10));