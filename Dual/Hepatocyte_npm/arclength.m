function a=arclength(A,p0,p1)
 a=0;
 [r c]=size(A);
 
 if p1-p0 == 1
     a=norm(A(p1,1:c)-A(p0,1:c));
 else
     for i=p0:p1-1
         a=a+norm(A(i+1,1:c)-A(i,1:c));
     end
 end
 
 