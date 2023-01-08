function  plot_part_bif_g(data,ind_x,ind_y,...
                    ind_stab,threshold,ind_figure,linewidth,iseq)

%% Detect changes of stability and changes of branch

ind = find(abs(data(1:end-1,ind_stab)- data(2:end,ind_stab)));
bla = find((data(1:end-1,ind_x)- data(1:end-1,ind_x))>threshold);
ind = sort([1;ind;bla;size(data,1)]);
%%
h=figure(ind_figure);
hold on
if iseq
for i = 1:(size(ind,1)-1)
    if data(ind(i)+1,ind_stab)==6
       plot(data(ind(i):ind(i+1),ind_x),data(ind(i):ind(i+1),ind_y),'g',...
           'linewidth',linewidth) 
    elseif data(ind(i)+1,ind_stab)==2
        plot(data(ind(i):ind(i+1),ind_x),data(ind(i):ind(i+1),ind_y),...
            'g--','linewidth',linewidth) 
    elseif data(ind(i)+1,ind_stab)==1
        plot(data(ind(i):ind(i+1),ind_x),data(ind(i):ind(i+1),ind_y),...
            'g--','color',[1    0.6100    0.1700],'linewidth',linewidth)
    else
        plot(data(ind(i):ind(i+1),ind_x),data(ind(i):ind(i+1),ind_y),...
            'g--','linewidth',linewidth)
    end
end
else 
for i = 1:(size(ind,1)-1)
    if data(ind(i)+1,ind_stab)==6
       plot(data(ind(i)+1:ind(i+1),ind_x),data(ind(i)+1:ind(i+1),ind_y),'g',...
           'linewidth',linewidth) 
    elseif data(ind(i)+1,ind_stab)==2
        plot(data(ind(i)+1:ind(i+1),ind_x),data(ind(i)+1:ind(i+1),ind_y),...
            'g--','color',[1    0.8100    0.3700],'linewidth',linewidth) 
    elseif data(ind(i)+1,ind_stab)==1
        plot(data(ind(i)+1:ind(i+1),ind_x),data(ind(i)+1:ind(i+1),ind_y),...
            'g--','linewidth',linewidth)
    else
        plot(data(ind(i)+1:ind(i+1),ind_x),data(ind(i)+1:ind(i+1),ind_y),...
            '--','color',[1    0    1],'linewidth',linewidth)
    end
end  
end


end

