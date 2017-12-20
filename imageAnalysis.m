originalImageFile=load(fullfile('image location goes here'));

imageNosieData=originalImageFile.imageNoise;
imageOriginalData=originalImageFile.imageOriginal;
% figure(1);
% imshow(imageOriginalData)
% figure(2);
% imshow(imageNosieData);
%%
originalImageFile.spectr=fft2(imageNosieData); %Calculate 2-D Fourier spectrum
originalImageFile.fourier = fftshift(originalImageFile.spectr);

%%
originalImageFile.magnitude = mat2gray(log(abs(originalImageFile.fourier)+1)); %amplitude
originalImageFile.phase = angle(originalImageFile.fourier);

figure('Name', '2-D signal spectrum amplitude');
imshow(originalImageFile.magnitude, []); % Display the spectrum
figure('Name', '2-D signal spectrum phase');
imshow(originalImageFile.phase, []); % Display the spectrum
