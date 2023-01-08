function [portion]=chope(A,N,ps,pv)
% ps : value for cross section
% pv : variable for cross section
inter = 1; % intersection number
%A=load('gamma1.dat');
p_start = 1;
%ps=-1;
%pv=2;
%N=50;
[r c]=size(A);
for p=1:1
    
    % shift data so start on poincare section 
    
    intern = 0;
    
    %portion = gam1;
    
    sgn_old = sign(A(1,pv+1)-ps);  
    for i=1:size(A,1)
       sgn = sign(A(i,pv+1)-ps);  
        if sgn ~= sgn_old
            intern = intern + 1;
            sgn_old = sign(A(i,pv+1)-ps);  
            if intern == inter
                p_start = i-1;
                sgn_s = sgn_old;
            end
        end
    end
    portion=zeros(N,c);
    
    if intern == 0
        p_start = 1;
        portion(1,:)=A(1,:);
    else
        portion(1,:)=A(p_start,:) + ((ps-A(p_start,pv+1))./(A(p_start+1,pv+1)-A(p_start,pv+1))).*(A(p_start+1,:)-A(p_start,:));
    end

    
    % calculate arclength between p_start and the end of the orbit, using
    % the arclength.m script

    a=arclength(A,p_start+1,length(A))+norm(A(p_start+1,:)-portion(1,:));
    
    % compute N-2 points regularly spaced on the initial orbit between both
    % cross sections
    A(p_start,:)=portion(1,:);
    aux=p_start;
    bit_arcl=a/(N-1);

    pres_arcl=norm(A(p_start+1,:)-portion(1,:));
    past_arcl=0;

    for k=2:N-1    
        while aux < length(A)
             if pres_arcl > (k-1)*bit_arcl
                  tau=((k-1)*bit_arcl-past_arcl)/(pres_arcl-past_arcl);
                  portion(k,:)=A(aux,:) + tau*(A(aux+1,:)-A(aux,:));
                  break;
              else
                  aux=aux+1;
                  past_arcl=pres_arcl;
                  pres_arcl=pres_arcl+norm(A(aux,:)-A(aux+1,:));
                  
              end  
        end
    end
portion(N,:)=A(length(A),:);
%portion    
end






