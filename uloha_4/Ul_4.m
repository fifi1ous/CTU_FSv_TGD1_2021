% zadani c.17
clc;clear;format long G
% souradnice ve vstupni soustave (elipsoid WGS84):
%     fi[� � ��]    lam[� � ��]    Hel[m]
S1_in = [
     50 50  2.776   14  1 46.901  265.182 %  1
     49 43  9.959   17  9 18.475  325.359 %  2
     47 13 11.557   14  4 16.142  211.753 %  3
     49 23 57.715   17 30 42.357  343.050 %  4
     48 34 21.302   15 24 36.601  210.876 %  5
     47 51 41.273   16 53 18.813  517.467 %  6
     47 43 46.555   17 52 25.692  599.692 %  7
     47 18 25.258   14 37 21.619  244.095 %  8
];
Awgs=6378137;
Bwgs=6356752.31425;
[XYZ_WGS] = el2cart(S1_in,Awgs,Bwgs);

% souradnice ve vystupni soustave (Besseluv elipsoid):
%      fi[� � ��]   lam[� � ��]    Hel[m]
S2_out = [
     50 50  5.688   14  1 50.916  221.928 %  1
     49 43 12.075   17  9 23.779  282.923 %  2
     47 13 12.948   14  4 19.360  164.611 %  3
     49 23 59.657   17 30 47.752  300.588 %  4
     48 34 23.125   15 24 40.764  165.751 %  5
     47 51 42.641   16 53 23.518  472.955 %  6
     47 43 47.758   17 52 30.833  556.054 %  7
     47 18 26.632   14 37 25.118  197.363 %  8
];
ABes=6377397.15508;
BBes=6356078.96290;
[XYZ_BES] = el2cart(S2_out,ABes,BBes);

[h_vyr,h0,m0,mh,mH,mX,residua,SS_tr] = hel_7_tr_dif(XYZ_BES,XYZ_WGS);

H0=h_vyr(1:4);
H1=deg2dms(h_vyr(5:end)/pi*180);
H0=[H0;H1(:,3)]';

mH0=mH(1:4);
H1=deg2dms(mH(5:end)/pi*180);
mH0=[mH0;H1(:,3)]';

