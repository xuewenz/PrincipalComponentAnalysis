%Written by Tan Xue Wen
%Please do not plagarise the code. Try to understand and write the code yourself, 
%it is more fun that way
%Any question do email to: xuewen@u.nus.edu

%Eigencat
CatImg_Dir = 'Cat_Pic/';
imagefiles = dir(strcat(CatImg_Dir,'*.jpg'));
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
    currentfilename = strcat((CatImg_Dir),(imagefiles(ii).name));
    currentimage = imread(currentfilename);
    if ndims(currentimage)==3
        currentimage = rgb2gray(currentimage);
    end
    Resizedimage = imresize(currentimage,[32 32]);
    FlatImg = Resizedimage(:);
    CatImg(:,ii) = FlatImg;
end

%Principal Component Analysis
%x = (Dim*Set)
x = double(CatImg);
xm = mean(x,2);
xbar = x - xm;
[Dim,Set] = size(xbar);
C = (1/Set)*xbar*xbar.';
[V,D] = eig(C);
V = real(V);
D = real(D);
[~,idx] = sort(diag(D),'descend');

%Taking Top 9 eigenvectors
V_Rep = V(:,idx(1:50));
[~,R_Sets] = size(V_Rep);

TopEigenvectors = zeros(32,32,R_Sets);
for i = 1:1:(R_Sets)
    TopEigenvectors(:,:,i) = reshape(V_Rep(:,i),[32,32]);
end

figure;
h    = [];
h(1) = subplot(3,3,1);
h(2) = subplot(3,3,2);
h(3) = subplot(3,3,3);
h(4) = subplot(3,3,4);
h(5) = subplot(3,3,5);
h(6) = subplot(3,3,6);
h(7) = subplot(3,3,7);
h(8) = subplot(3,3,8);
h(9) = subplot(3,3,9);

imagesc(TopEigenvectors(:,:,1),'Parent',h(1));
imagesc(TopEigenvectors(:,:,2),'Parent',h(2));
imagesc(TopEigenvectors(:,:,3),'Parent',h(3));
imagesc(TopEigenvectors(:,:,4),'Parent',h(4));
imagesc(TopEigenvectors(:,:,5),'Parent',h(5));
imagesc(TopEigenvectors(:,:,6),'Parent',h(6));
imagesc(TopEigenvectors(:,:,7),'Parent',h(7));
imagesc(TopEigenvectors(:,:,8),'Parent',h(8));
imagesc(TopEigenvectors(:,:,9),'Parent',h(9));

figure;
imshow(uint8(reshape(xm,[32,32])))

%PCA representation
for i = 1:1:Set
    for k = 1:1:R_Sets
        EigenImg(k,i) = V_Rep(:,k).'*xbar(:,i);
    end
end

%PCA Construction
for i = 1:1:Set
    EigenSum = zeros(Dim,1);
    for k = 1:1:R_Sets
        EigenSum = EigenSum + (EigenImg(k,i)*V_Rep(:,k));
        ConstImg(:,i) = EigenSum;
    end
end

ConstImg = ConstImg + xm;
for i = 1:1:Set
    ConstImgReshape(:,:,i) = reshape(ConstImg(:,i),[32,32]);
end

figure;
Uint8_ConstImg = uint8(ConstImgReshape);
montage(Uint8_ConstImg)


 
