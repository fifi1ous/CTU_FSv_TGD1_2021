function [st]=dms2deg(v)
%p�evod stup��, minut, vte�in na desetin� ��slo
%vstup:
%   v-matice [s m v]
%vystup:
%   st-desetin� ��slo
[r]=size(v,1);
st=ones(r,1);
for i=1:r
        if any(v(i,:)<0)
            Q=(-1);
        else
            Q=(1);
        end
        st(i,1)=(abs(v(i,1))+abs(v(i,2)/60)+abs(v(i,3)/3600))*Q;
end
end