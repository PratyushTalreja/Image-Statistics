# Image-Statistics

The aim of this project is to generate the image statistics band-by-band for a multispectral image – mean, median, mode, variance, skewness, kurtosis

**Concept
The concept used here is to convert the given image(multi-bands) into different band image(band by band). Then calculate the histogram of the image band by band which displays the frequency of pixels from 0-255. The following formulae were used to calculate different parameters band by band:
Mean: μ = Σ n.f(n) / (M.N)
Variance: σ^2= Σn.f(n)([n-μ]^2)/ (M.N)
Skewness: [Σf(n)([n-μ]^3)]/[(M.N – 1)*(σ^3)]
Kurtosis: {[Σf(n)([n-μ]^4)]/[(M.N – 1)*(σ^4)]} - 3
Mode is the value of the pixel/s which occurs for the maximum times.
Median: First arrange the frequencies in ascending order. If the number of elements are odd then the middle element is the median
Example: 10,12,13,14,15
Median = 13
If the number of elements are even then average of 2 middle elements is the median.
Example: 22,24,25,27,28,30 Median = (25+27)/2 = 26
