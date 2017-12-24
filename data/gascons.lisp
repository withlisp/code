;% Dataset from Smoothing Methods in Statistics
;% (ftp stat.cmu.edu/datasets)
;%
;% Simonoff, J.S. (1996). Smoothing Methods in Statistics. New York: Springer-Verlag.
;%
;%
;% Gasoline comnsumption is being treated as the class
;% attribute.
(defun gascons ()
  (data
    :name 'gascons
    :columns '(year price_index_for_casoline disposable_income price_index_for_used_cars gasoline_consumption)
    :egs
    '(
      (1960 0.925 6036 0.836 129.7)
      (1961 0.914 6113 0.869 131.3)
      (1962 0.919 6271 0.948 137.1)
      (1963 0.918 6378 0.96 141.6)
      (1964 0.914 6727 1.001 148.8)
      (1965 0.949 7027 0.994 155.9)
      (1966 0.97 7280 0.97 164.9)
      (1967 1 7513 1 171)
      (1968 1.014 7728 1.028 183.4)
      (1969 1.047 7891 1.031 195.8)
      (1970 1.056 8134 1.043 207.4)
      (1971 1.063 8322 1.102 218.3)
      (1972 1.076 8562 1.105 226.8)
      (1973 1.181 9042 1.176 237.9)
      (1974 1.599 8867 1.226 225.8)
      (1975 1.708 8944 1.464 232.4)
      (1976 1.779 9175 1.679 241.7)
      (1977 1.882 9381 1.828 249.2)
      (1978 1.963 9735 1.865 261.3)
      (1979 2.656 9829 2.01 248.9)
      (1980 3.691 9722 2.081 226.8)
      (1981 4.109 9769 2.569 225.6)
      (1982 3.894 9725 2.964 228.8)
      (1983 3.764 9930 3.297 239.6)
      (1984 3.707 421 3.757 244.7)
      (1985 3.738 563 3.797 245.8)
      (1986 2.921 780 3.632 269.4)
      )))
