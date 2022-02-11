# Seam Carving for content-aware image resizing (CAIR)

This repository contains a MATLAB implementation of the seam-carving algorithm described in the
[2007 ACM SIGGRAPH paper from S. Avidan and S. Amir](https://faculty.idc.ac.il/arik/SCWeb/imret/index.html).
<br>
This implementation first calculates the energy map of an image by using the Sobel operator to compute better gradient thresholds.
Second, the low-cost energy matrices both vertically and horizontally are generated. 
Third, we determine the optimal pixel paths by using dynamic programming. 
Below you can find demonstrations of (i) vertically and (ii) horizontal carving seams.

<p align="center">
  <img src="https://user-images.githubusercontent.com/49384703/146843024-f3e40187-f72e-43cb-8b32-b3fa738da04b.gif" width=400> 
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/49384703/146843037-89a992ed-b6d1-4c71-bda7-13076cc5bef8.gif" width=400> 
</p>