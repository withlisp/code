;%
;% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;%
;% Survival treated as the class attribute
;%
;% As used by Kilpatrick, D. & Cameron-Jones, M. (1998). Numeric prediction
;% using instance-based learning with encoding length selection. In Progress
;% in Connectionist-Based Information Systems. Singapore: Springer-Verlag.
;%
;% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;%
;% 1. Title: Echocardiogram Data
;%
;% 2. Source Information:
;%    -- Donor: Steven Salzberg (salzberg@cs.jhu.edu)
;%    -- Collector:
;%       -- Dr. Evlin Kinney
;%       -- The Reed Institute
;%       -- P.O. Box 402603
;%       -- Maimi, FL 33140-0603
;%    -- Date Received: 28 February 1989
;%
;% 3. Past Usage:
;%    -- 1. Salzberg, S. (1988).  Exemplar-based learning: Theory and
;%          implementation (Technical Report TR-10-88).  Harvard University,
;%          Center for Research in Computing Technology, Aiken Computation
;%          Laboratory (33 Oxford Street; Cambridge, MA 02138).
;%       -- Steve applied his EACH program to predict survival (i.e., life
;%          or death), did not use the wall-motion attribute, and recorded 87
;%          correct and 29 incorrect in an incremental application to this
;%          database.  He also showed that, by tuning EACH to this domain,
;%          EACH was able to derive (non-incrementally) a set of 28
;%          hyper-rectangles that could perfectly classify 119 instances.
;%    -- 2. Kan, G., Visser, C., Kooler, J., & Dunning, A. (1986).  Short
;%          and long term predictive value of wall motion score in acute
;%          myocardial infarction.  British Heart Journal, 56, 422-427.
;%       -- They predicted the same variable (whether patients will live
;%          one year after a heart attack) using a different set of 345
;%          instances.  Their statistical test recorded a 61% accuracy
;%          in predicting that a patient will die (post-hoc fit).
;%    -- 3. Elvin Kinney (in communication with Steven Salzberg) reported
;%          that a Cox regression application recorded a 60% accuracy
;%          in predicting that a patient will die.
;%
;% 4. Relevant Information:
;%   -- All the patients suffered heart attacks at some point in the past.
;%      Some are still alive and some are not.  The survival and still-alive
;%      variables, when taken together, indicate whether a patient survived
;%      for at least one year following the heart attack.
;%
;%      The problem addressed by past researchers was to predict from the
;%      other variables whether or not the patient will survive at least
;%      one year.  The most difficult part of this problem is correctly
;%      predicting that the patient will NOT survive.  (Part of the difficulty
;%      seems to be the size of the data set.)
;%
;% 5. Number of Instances: 132
;%
;% 6. Number of Attributes: 13 (all numeric-valued)
;%
;% 7. Attribute Information:
;%    1. survival -- the number of months patient survived (has survived,
;%                   if patient is still alive).  Because all the patients
;%                   had their heart attacks at different times, it is
;%                   possible that some patients have survived less than
;%                   one year but they are still alive.  Check the second
;%                   variable to confirm this.  Such patients cannot be
;%                   used for the prediction task mentioned above.
;%    2. still-alive -- a binary variable.  0=dead at end of survival period,
;%                      1 means still alive
;%    3. age-at-heart-attack -- age in years when heart attack occurred
;%    4. pericardial-effusion -- binary. Pericardial effusion is fluid
;%                               around the heart.  0=no fluid, 1=fluid
;%    5. fractional-shortening -- a measure of contracility around the heart
;%                                lower numbers are increasingly abnormal
;%    6. epss -- E-point septal separation, another measure of contractility.
;%               Larger numbers are increasingly abnormal.
;%    7. lvdd -- left ventricular end-diastolic dimension.  This is
;%               a measure of the size of the heart at end-diastole.
;%               Large hearts tend to be sick hearts.
;%    8. wall-motion-score -- a measure of how the segments of the left
;%                            ventricle are moving
;%    9. wall-motion-index -- equals wall-motion-score divided by number of
;%                            segments seen.  Usually 12-13 segments are seen
;%                            in an echocardiogram.  Use this variable INSTEAD
;%                            of the wall motion score.
;%    10. mult -- a derivate var which can be ignored
;%    11. name -- the name of the patient (I have replaced them with "name")
;%    12. group -- meaningless, ignore it
;%    13. alive-at-1 -- Boolean-valued. Derived from the first two attributes.
;%                      0 means patient was either dead after 1 year or had
;%                      been followed for less than 1 year.  1 means patient
;%                      was alive at 1 year.
;%
;% 8. Missing Attribute Values: (denoted by "?")
;%    Attribute #:    Number of Missing Values: (total: 132)
;%    ------------    -------------------------
;%               1    2
;%               2    1
;%               3    5
;%               4    1
;%               5    8
;%               6    15
;%               7    11
;%               8    4
;%               9    1
;%              10    4
;%              11    0
;%              12    22
;%              13    58
;%
;% 9. Distribution of attribute number 2: still-alive
;%    Value   Number of instances with this value
;%     ----   -----------------------------------
;%       0    88 (dead)
;%       1    43 (alive)
;%       ?    1
;%     Total  132
;%
;%
;% 10. Distribution of attribute number 13: alive-at-1
;%    Value   Number of instances with this value
;%     ----   -----------------------------------
;%       0    50
;%       1    24
;%       ?    58
;%     Total  132
;%
(defun echoMonths ()
  (data
    :name 'echoMonths
    :columns '(still_alive age pericardial fractional epss lvdd wall_score wall_index alive_at_1 class)
    :egs
    '(
      (0 71 0 0.26 9 4.6 14 1 0 11)
      (0 72 0 0.38 6 4.1 14 1.7 0 19)
      (0 55 0 0.26 4 3.42 14 1 0 16)
      (0 60 0 0.253 12.062 4.603 16 1.45 0 57)
      (1 57 0 0.16 22 5.75 18 2.25 0 19)
      (0 68 0 0.26 5 4.31 12 1 0 26)
      (0 62 0 0.23 31 5.43 22.5 1.875 0 13)
      (0 60 0 0.33 8 5.25 14 1 0 50)
      (0 46 0 0.34 0 5.09 16 1.14 0 19)
      (0 54 0 0.14 13 4.49 15.5 1.19 0 25)
      (1 77 0 0.13 16 4.23 18 1.8 1 10)
      (0 62 1 0.45 9 3.6 16 1.14 0 52)
      (0 73 0 0.33 6 4 14 1 0 52)
      (0 60 0 0.15 10 3.73 14 1 0 44)
      (1 62 0 0.12 23 5.8 11.67 2.33 1 0.5)
      (0 55 1 0.25 12.063 4.29 14 1 0 24)
      (1 69 1 0.26 11 4.65 18 1.64 1 0.5)
      (1 62.529 1 0.07 20 5.2 24 2 1 0.5)
      (1 66 0 0.09 17 5.819 8 1.333 0 22)
      (1 66 1 0.22 15 5.4 27 2.25 1 1)
      (1 69 0 0.15 12 5.39 19.5 1.625 1 0.75)
      (1 85 1 0.18 19 5.46 13.83 1.38 1 0.75)
      (1 73 0 0.23 12.733 6.06 7.5 1.5 1 0.5)
      (1 71 0 0.17 0 4.65 8 1 1 5)
      (0 64 0 0.19 5.9 3.48 10 1.11 ? 48)
      (0 54 0 0.3 7 3.85 10 1.667 ? 29)
      (0 35 0 0.3 5 4.17 14 1 ? 29)
      (0 55 0 ? 7 ? 2 1 ? 29)
      (1 75 0 ? ? ? ? 1 ? 0.25)
      (0 55 1 0.21 4.2 4.16 14 1.56 0 36)
      (1 65 0 0.15 ? 5.05 10 1 ? 1)
      (1 52 1 0.17 17.2 5.32 14 1.17 ? 1)
      (1 ? 0 ? 12 ? 6 3 ? 3)
      (0 47 0 0.4 5.12 3.1 12 1 ? 27)
      (0 63 0 ? 10 ? 14 1.17 0 35)
      (0 61 0 0.61 13.1 4.07 13 1.625 0 26)
      (0 63 1 ? ? 5.31 5 1 0 16)
      (1 65 0 0.06 23.6 ? 21.5 2.15 1 1)
      (0 68 0 0.51 ? 3.88 15 1.67 0 19)
      (0 80 0 0.41 5.4 4.36 ? 1 ? 31)
      (0 54 0 0.35 9.3 3.63 11 1.222 0 32)
      (0 70 1 0.27 4.7 4.49 22 2 0 16)
      (0 79 0 0.15 17.5 4.27 13 1.3 0 40)
      (0 56 0 0.33 ? 3.59 14 1 0 46)
      (1 67 1 0.44 9 3.96 17.5 1.45 ? 2)
      (0 64 0 0.09 ? ? 12 2 ? 37)
      (1 81 0 0.12 ? ? 9 1.25 0 19.5)
      (1 59 0 0.03 21.3 6.29 17 1.31 0 20)
      (1 63 1 ? ? ? 23 2.3 1 0.25)
      (1 56 1 0.04 14 5 ? ? 1 2)
      (1 61 1 0.27 ? ? 9 1.5 1 7)
      (0 57 0 0.24 14.8 5.26 18 1.38 ? 10)
      (0 58 0 0.3 9.4 3.49 14 1 0 12)
      (1 60 0 0.01 24.6 5.65 39 3 1 1)
      (0 66 0 0.29 15.6 6.15 14 1 0 10)
      (0 63 0 0.15 13 4.57 13 1.08 0 45)
      (0 57 0 0.13 18.6 4.37 12.33 1.37 0 22)
      (0 70 0 0.1 9.8 5.3 23 2.3 0 53)
      (0 68 0 0.29 ? 4.41 14 1.167 ? 38)
      (0 79 0 0.17 11.9 5.15 10.5 1.05 0 26)
      (0 73 0 0.12 ? 6.78 16.67 1.39 ? 9)
      (0 72 0 0.187 12 5.02 13 1.18 0 26)
      (1 59 0 0.13 16.4 4.96 17.83 1.37 ? 0.5)
      (0 67 1 0.11 10.3 4.68 11 1 ? 12)
      (0 51 0 0.16 13.2 5.26 11 1 0 49)
      (1 50 0 0.14 11.4 4.75 10 2.5 ? 0.75)
      (0 70 1 0.25 9.7 5.57 5.5 1.1 0 49)
      (0 65 0 0.36 8.8 5.78 12 1 0 47)
      (0 78 0 0.06 16.1 5.62 13.67 1.367 0 41)
      (1 86 0 0.225 12.2 5.2 24 2.18 1 0.25)
      (0 56 0 0.25 11 4.72 11 1 0 33)
      (0 60 0 0.12 10.2 4.31 15 1.67 0 29)
      (0 59 0 0.29 7.5 4.75 13 1.08 0 41)
      (0 50 0 0.06 30.1 5.95 21.5 2.39 ? 26)
      (0 54 0 0.217 17.9 4.54 16.5 1.18 0 15)
      (1 68 0 0.22 21.7 4.85 15 1.15 ? 0.25)
      (1 ? 0 0.26 19.4 4.77 21 2.1 1 0.03)
      (0 64 0 0.2 7.1 4.58 14 1 0 12)
      (0 63 0 0.2 5 5.2 8 1 ? 32)
      (0 65 0 0.06 23.6 6.74 12 1.09 ? 32)
      (0 54 1 0.07 16.8 4.16 18 1.5 0 27)
      (0 62 0 0.25 6 4.48 11 1 ? 23)
      (1 78 0 0.05 10 4.44 15 1.36 1 0.75)
      (1 61 0 ? ? ? 28 2.33 1 0.75)
      (0 52 0 0.14 25 6.21 11.5 1.15 ? 34)
      (1 73 0 0.05 14.8 4.14 15.5 1.41 ? 1)
      (1 70 1 0.16 19.2 5.25 11 1 ? 21)
      (0 55 0 0.28 5.5 4.48 22 1.83 0 55)
      (1 60 0 0.18 8.7 4.56 13.5 1.04 ? 15)
      (1 67 0 0.155 11.3 5.16 13 1 ? 0.5)
      (0 64 0 0.3 6.6 4.36 14 1.27 ? 35)
      (0 59 0 0.344 9.1 4.04 9 1 0 53)
      (0 46 0 0.272 16.5 5.36 12.67 1.06 ? 33)
      (0 63 0 0.25 5.6 3.87 18 1.5 ? 33)
      (1 74 0 0.2 4.8 4.56 12.5 1.04 0 40)
      (0 59 0 0.5 9.1 3.42 18 1.5 ? 33)
      (1 65 1 0.16 8.5 5.47 16 1.45 1 5)
      (1 58 0 0.17 28.9 6.73 26.08 2.01 1 4)
      (0 53 0 0.17 ? 4.69 10 1 ? 31)
      (0 66 0 0.2 ? 4.23 12 1 0 33)
      (0 70 0 0.38 0 4.55 10 1 0 22)
      (0 62 0 0.258 11.8 4.87 11 1 ? 25)
      (1 63 0 0.3 6.9 3.52 18.16 1.51 1 1.25)
      (0 59 0 0.17 14.3 5.49 13.5 1.5 0 24)
      (0 57 0 0.228 9.7 4.29 11 1 0 25)
      (0 57 0 0.036 7 4.12 13.5 1.23 ? 24)
      (1 78 0 0.23 40 6.23 14 1.4 1 0.75)
      (1 62 0 0.26 7.6 4.42 14 1 1 3)
      (0 62 0 0.22 12.1 3.92 11 1 ? 27)
      (0 66 0 0.24 13.6 4.38 22 2.2 ? 13)
      (0 61 0 0.27 9 4.06 12 1 ? 36)
      (0 59 1 0.4 9.2 5.36 12 1 ? 25)
      (0 57 0 0.29 9.4 4.77 9 1 ? 27)
      (0 62 1 0.19 28.9 6.63 19.5 1.95 ? 34)
      (0 ? 0 0.26 0 4.38 9 1 ? 37)
      (0 54 0 0.43 9.3 4.79 10 1 ? 34)
      (1 62 1 0.24 28.6 5.86 21.5 1.95 ? 28)
      (0 ? 0 0.23 19.1 5.49 12 1.2 ? 28)
      (0 64 0 0.15 6.6 4.17 14 1.27 ? 17)
      (0 57 1 0.12 0 2.32 16.5 1.375 ? 38)
      (0 61 0 0.18 0 4.48 11 1.375 ? 31)
      (0 61 1 0.19 13.2 5.04 19 1.73 ? 12)
      (0 48 0 0.15 12 3.66 10 1 ? 36)
      (0 ? 0 0.09 6.8 4.96 13 1.08 ? 17)
      (0 61 0 0.14 25.5 5.16 14 1.27 ? 21)
      (1 64 0 0.24 12.9 4.72 12 1 ? 7.5)
      (0 64 0 0.28 5.4 5.47 11 1.1 ? 41)
      (0 69 0 0.2 7 5.05 14.5 1.21 ? 36)
      (0 57 0 0.14 16.1 4.36 15 1.36 ? 22)
      (0 62 0 0.15 0 4.51 15.5 1.409 ? 20)
      )))
