%PlotXppaut3d
%Plot 3-dimensional bifurcation diagrams in Matlab that have been saved by XPPAUT
%
%How to use:
%1a. Compute bifurcation diagram in AUTO (XPPAUT) then click-->File--->Write Pts
%    and save your bifurcation diagram in a .dat file
%    The name of the dat file should be X.dat
%    where X is a +/- real number: *IMPORTANT* X should not contain 
%    anything except plus, minus, decimal point, and numbers
%    i.e. X is a valid real or integer number
%    **Otherwise program will crash**
%    
%
%
%1b. Change your parameter and repeat step 1a
%    
%1c. Once you have as many such files as you need
%    deposit them in a new directory that contains
%    only these files and nothing else
%
%2.  In Matlab command window type: plotxppaut3d 
%    Select any .dat file saved in steps 1a-1c
%    A three dimensional bifurcation diagram will be plotted
%
%3.  Cutomize the plot using Matlab figure editor
%    Or edit program parameters to suit your needs--very useful for those who
%    plot lots of bifurcation diagrams
%
%Version 1.0 Tested Under Matlab 6.1 (R12.1)
%M.S. Imtiaz
%Requires:get_fnames.m


%---------------------------------------
%Version 1.0
%Time-stamp: <2005-05-03 17:06:11 msi800> 
%-------------------------------------------
%Mohammad S. Imtiaz
%Room 403
%The Neuroscience Group
%Discipline of Human Physiology
%School of Biomedical Sciences
%Faculty of Health
%The University of Newcastle
%Callaghan, NSW 2308
%Australia
%Tel: +61 02 49217857  (Office)
%Tel: +61 02 49215626  (Lab)
%Fax: +61 02 49217406
%Email: Mohammad.Imtiaz@newcastle.edu.au
%-------------------------------------------
%-------------------------------------------


%-----------------------------------------	
%       END OF DOCUMENTATION
%-----------------------------------------



%-------------------------------------------------------------------
%       BEGIN USER DEFINED PARAMETERS -- CHANGE TO CUSTOMIZE OUTPUT PLOT
%-------------------------------------------------------------------
%Colors -- SHOULD BE VALID MATLAB COLORS
C_Ss = 'Black';   %STABLE STEADY STATE
C_Us = 'Black';   %UNSTABLE STEADY STATE
C_Sp = 'Red';     %STABLE PERIODIC ORBIT
C_Up = 'Blue';    %UNSTABLE PERIODIC ORBIT

%LineStyle -- SHOULD BE VALID MATLAB LINESTYLES
Lt_Ss = '-';    %STABLE STEADY STATE
Lt_Us = '--';   %UNSTABLE STEADY STATE
Lt_Sp = 'o';    %STABLE PERIODIC ORBIT
Lt_Up = 'o';    %UNSTABLE PERIODIC ORBIT

%Linewidths
Lw_Ss = 1.5;   %STABLE STEADY STATE
Lw_Us = 1;     %UNSTABLE STEADY STATE
Lw_Sp = 1;     %STABLE PERIODIC ORBIT
Lw_Up = 1;     %UNSTABLE PERIODIC ORBIT

%Markersize
Ms_Ss = 2;    %STABLE STEADY STATE
Ms_Us = 2;    %UNSTABLE STEADY STATE
Ms_Sp = 3;    %STABLE PERIODIC ORBIT
Ms_Up = 3;    %UNSTABLE PERIODIC ORBIT

%MarkerFaceColor -- SHOULD BE VALID MATLAB COLORS
Mfc_Ss = 'none';   %STABLE STEADY STATE
Mfc_Us = 'none';   %UNSTABLE STEADY STATE
Mfc_Sp = 'Red';    %STABLE PERIODIC ORBIT
Mfc_Up = 'none';   %UNSTABLE PERIODIC ORBIT

%-----------------------------------------	
%        END OF USER DEFINED PARAMETERS
%-----------------------------------------



[file_in,path_in] = uigetfile('*.dat','.dat file saved by AUTO (XPPAUT) ');
file_name = [path_in file_in];

[f_names_sorted f_v_sorted] = get_fnames(path_in);

figure

for File_no=1:length(f_v_sorted),
  file_name = f_names_sorted(File_no);
  file_name = char(file_name);
  disp(['Processing file ' file_name])
if(file_name),
  fid = fopen([path_in file_name],'r');
  st = fscanf(fid,'%f',[5,inf]);
  fclose(fid);
  
  
  
  temp=st';
  
  temp1=zeros(size(temp,1),8)*NaN;
  
  for n=1:size(temp1,1),
    if(temp(n,4)==1),
      temp1(n,[1 5]) = temp(n,[2 3]);
    end;
    if(temp(n,4)==2),
      temp1(n,[2 6]) = temp(n,[2 3]);
    end;
    if(temp(n,4)==3),
      temp1(n,[3 7]) = temp(n,[2 3]);
    end;
    if(temp(n,4)==4),
      temp1(n,[4 8]) = temp(n,[2 3]);
    end;
  end;
  
  
% $$$ figure;
%	-----------------------------------------  
  h_SS = plot3(temp(:,1),ones(size(temp(:,1)))+f_v_sorted(File_no),temp1(:,[1 5]));
  set(h_SS,'color',C_Ss);
  set(h_SS,'linestyle',Lt_Ss);
  set(h_SS,'linewidth',Lw_Ss);
  set(h_SS,'Markersize',Ms_Ss);
  set(h_SS,'MarkerFacecolor',Mfc_Ss);
  hold on;
  
%	-----------------------------------------  
  h_US = plot3(temp(:,1),ones(size(temp(:,1)))+f_v_sorted(File_no),temp1(:,[2 6]));
  set(h_US,'color',C_Us);
  set(h_US,'linestyle',Lt_Us);
  set(h_US,'linewidth',Lw_Us);
  set(h_US,'Markersize',Ms_Us);
  set(h_US,'MarkerFacecolor',Mfc_Us);

%	-----------------------------------------  
  

h_SP = plot3(temp(:,1),ones(size(temp(:,1)))+f_v_sorted(File_no),temp1(:,[3 7]));
  set(h_SP,'color',C_Sp);
  set(h_SP,'linestyle',Lt_Sp);
  set(h_SP,'linewidth',Lw_Sp);
  set(h_SP,'Markersize',Ms_Sp);
  set(h_SP,'MarkerFacecolor',Mfc_Sp);
%	-----------------------------------------   
  
  
  h_UP = plot3(temp(:,1),ones(size(temp(:,1)))+f_v_sorted(File_no),temp1(:,[4 8]));
  set(h_UP,'color',C_Up);
  set(h_UP,'linestyle',Lt_Up);
  set(h_UP,'linewidth',Lw_Up);
  set(h_UP,'Markersize',Ms_Up);
  set(h_UP,'MarkerFacecolor',Mfc_Up);
%	-----------------------------------------    
  
  
  grid on;
  axis tight;
  xlabel('Bifurcation parameter');
  ylabel('Bifurcation parameter (files)');
  %title(file_name);
  view(40,52)
end;
end;
