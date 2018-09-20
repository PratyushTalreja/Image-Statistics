# Image-Statistics

The aim of this project is to generate the image statistics band-by-band for a multispectral image – mean, median, mode, variance, skewness, kurtosis

**Concept**

The concept used here is to convert the given image(multi-bands) into different band image(band by band). Then calculate the histogram of the image band by band which displays the frequency of pixels from 0-255. The following formulae were used to calculate different parameters band by band:

1. Mean: μ = Σ n.f(n) / (M.N)
2. Variance: σ^2= Σn.f(n)([n-μ]^2)/ (M.N)
3. Skewness: [Σf(n)([n-μ]^3)]/[(M.N – 1)*(σ^3)]
4. Kurtosis: {[Σf(n)([n-μ]^4)]/[(M.N – 1)*(σ^4)]} - 3
5. Mode is the value of the pixel/s which occurs for the maximum times.
6. Median: First arrange the frequencies in ascending order. If the number of elements are odd then the middle element is the median
