# Principal Component Analysis (PCA)
## Introduction
PCA is usually used in facial recognition due to its ability to "detect" characteristics of the target (e.g face) as long as there are sufficient images for it to train with. In addition, the benefits of using PCA is dimensionality reduction by converting values (in this case pixels) into vectors values that represent the principal axis. Principal axis is the vector that represents the many images and the axis with the most variance contains the most information. Hence the beauty of this algorithm is, it is able to convert a 32 x 32 (1024 values) into only 50 values for example if the top 50 eigenvalues are chosen. It will be clearer as we proceed.

![Alt text](https://github.com/Chen-XueWen/PrincipalComponentAnalysis/blob/master/EigenCat.png)

## Outcome
The image below showcase the top 9 eigenvectors for the cat images.
![Alt_text](https://github.com/Chen-XueWen/PrincipalComponentAnalysis/blob/master/Top9EigenCat.jpg)

Lastly, the reconstructed cat images from the top 50 eigenvectors.
![Alt_text](https://github.com/Chen-XueWen/PrincipalComponentAnalysis/blob/master/Reconstruct.jpg)

## Conclusion
When you perform PCA, you will see that each image becomes only k dimensions as opposed to the 32x32 pixels which can be detrimental (if large amount of images: talking about millions here) when we input it directly to a machine learning algorithm. Hence it is wise to reduce the dimension such that it sufficiently represent/compress the dataset and retain its integrity.

*P.S Download the PCA.m files to experiment around

### This guide is written by xue wen. Any questions do email to xuewen@u.nus.edu
